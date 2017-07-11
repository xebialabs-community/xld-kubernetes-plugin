#
# THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS
# FOR A PARTICULAR PURPOSE. THIS CODE AND INFORMATION ARE NOT SUPPORTED BY XEBIALABS.
#

import json
from overtherepy import OverthereHostSession


def inc_context():
    key = "wait_replicates_{0}".format(podname)
    if context.getAttribute(key) is None:
        context.setAttribute(key, int(0))
    value = context.getAttribute(key)
    value = value + 1
    context.setAttribute(key, value)


def get_value_context():
    key = "wait_replicates_{0}".format(podname)
    return context.getAttribute(key)


def get_available_replicas(data):
    try:
        return int(data['status']['availableReplicas'])
    except:
        return -1


attempts = 10
deployment_name = podname
if deployed.namespace is not None:
    command_line = "{2} get deployment {0} --namespace={1} -o=json".format(deployment_name, deployed.namespace, deployed.container.command)
else:
    command_line = "{2} get deployment {0} -o=json".format(deployment_name, deployed.namespace, deployed.container.command)

print command_line
try:
    session = OverthereHostSession(deployed.container.host)
    response = session.execute(command_line)
    data = json.loads(" ".join(response.stdout))

    condition = data['status']['conditions'][0]
    print "Status {status} {reason}: {message}".format(**condition)
    availableReplicas = get_available_replicas(data)
    print "availableReplicas {0}/{1}".format(availableReplicas, deployed.replicas)

    if condition['status'] == "True":
        print "Status Ok"
    elif availableReplicas == deployed.replicas:
        print "DONE replicas"
    else:
        inc_context()
        cpt = get_value_context()
        print "WAIT....{0}/{1}".format(cpt, attempts)
        if cpt < int(attempts):
            result = "RETRY"
        else:
            print "Too many attempts {0}".format(attempts)
            result = int(attempts)

finally:
    session.close_conn()
