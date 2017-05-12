#
# THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS
# FOR A PARTICULAR PURPOSE. THIS CODE AND INFORMATION ARE NOT SUPPORTED BY XEBIALABS.
#

import json
from overtherepy import OverthereHostSession

service_name = deployed.serviceName or deployed.name
command_line = "kubectl get service {0} --namespace=guestbook -o=json".format(service_name)
print command_line
session = OverthereHostSession(deployed.container.host)
response = session.execute(command_line)
data = json.loads(" ".join(response.stdout))
try:
    external_ip = data['status']['loadBalancer']['ingress'][0]['ip']
    print "EXTERNAL-IP {0}".format(external_ip)
except:
    print "EXTERNAL-IP <pending>"
    result = "RETRY"
finally:
    session.close_conn()
