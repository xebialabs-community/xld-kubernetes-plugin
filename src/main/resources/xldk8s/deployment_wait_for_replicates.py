#
# THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS
# FOR A PARTICULAR PURPOSE. THIS CODE AND INFORMATION ARE NOT SUPPORTED BY XEBIALABS.
#

import json
from overtherepy import OverthereHostSession

def get_available_replicas(data):
    try:
        return int(data['status']['availableReplicas'])
    except:
        return -1



deployment_name = podname
command_line = "kubectl get deployment {0} --namespace={1} -o=json".format(deployment_name, deployed.namespace)
print command_line
try:
    session = OverthereHostSession(deployed.container.host)
    response = session.execute(command_line)
    data = json.loads(" ".join(response.stdout))

    condition = data['status']['conditions'][0]
    print "Status {status} {reason}: {message}".format(**condition)
    availableReplicas = get_available_replicas(data)
    print "availableReplicas {0}/{1}".format(availableReplicas, deployed.replicas)

    if availableReplicas == deployed.replicas:
        print "DONE"
    else:
        print "WAIT"
        result = "RETRY"

finally:
    session.close_conn()
