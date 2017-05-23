#
# THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS
# FOR A PARTICULAR PURPOSE. THIS CODE AND INFORMATION ARE NOT SUPPORTED BY XEBIALABS.
#

def modified_properties(delta):
    # {propertyname: (value, previousvalue), propertyname:  (value, previousvalue)]
    modified = {}
    ci_type = delta.deployed.type
    ci_descriptor = metadataService.findDescriptor(Type.valueOf(str(ci_type)))
    for pd in ci_descriptor.getPropertyDescriptors():
        if not pd.get(delta.deployed) == pd.get(delta.previous):
            modified[pd.name] = (pd.get(delta.deployed), pd.get(delta.previous))
    return modified


def is_scaling(delta):
    result = modified_properties(delta)
    if len(result) == 1 and 'replicas' in result:
        scale_steps(delta, modified=result)
        return True

    return False


def scale_steps(delta, modified):
    deployed = delta.deployed
    context.addStep(steps.os_script(
        description="Scale the '{0}' pod on {1}".format(deployed.name,
                                                        deployed.container.name),
        order=62,
        script='xldk8s/scale_deployment',
        target_host=deployed.container.host,
        freemarker_context={'deployed': deployed}
    ))


def destroy_create_steps(deployed, previousDeployed):
    context.addStep(steps.os_script(
        description="Destroy the '{0}' pod on {1}".format(previousDeployed.name,
                                                          previousDeployed.container.name),
        order=41,
        script='xldk8s/destroy_deployment',
        target_host=deployed.container.host,
        freemarker_context={'previousDeployed': deployed}
    ))

    context.addStep(steps.os_script(
        description="Create the '{0}' pod on {1}".format(deployed.name,
                                                         deployed.container.name),
        order=62,
        script='xldk8s/create_deployment',
        target_host=deployed.container.host,
        freemarker_context={'deployed': deployed}
    ))


def modify(delta):
    if not is_scaling(delta):
        destroy_create_steps(deployed=delta.deployed, previousDeployed=delta.previous)


modify(delta)
