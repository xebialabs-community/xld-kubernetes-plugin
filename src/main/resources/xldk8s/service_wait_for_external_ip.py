#
# THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS
# FOR A PARTICULAR PURPOSE. THIS CODE AND INFORMATION ARE NOT SUPPORTED BY XEBIALABS.
#

import json
from overtherepy import OverthereHostSession

def inc_context():
    key= "wait_{0}".format(service_name)
    if context.getAttribute(key) is None:
        context.setAttribute(key,int(0))
    value = context.getAttribute(key)
    value =  value + 1
    context.setAttribute(key,value)

def get_value_context():
    key= "wait_{0}".format(service_name)
    return context.getAttribute(key)



service_name = deployed.serviceName or deployed.name
command_line = "{2} get service {0} --namespace={1} -o=json".format(service_name, deployed.namespace, deployed.container.command)
print command_line
session = OverthereHostSession(deployed.container.host)
response = session.execute(command_line)
data = json.loads(" ".join(response.stdout))
try:
    external_ip = data['status']['loadBalancer']['ingress'][0]['ip']
    print "EXTERNAL-IP {0}".format(external_ip)
except:
    inc_context()
    cpt = get_value_context()
    print "EXTERNAL-IP <pending>....{0}/{1}".format(cpt, attempts)
    if cpt < int(attempts):
        result = "RETRY"
    else:
        print "Too many attempts {0}".format(attempts)
        result = int(cpt)

finally:
    session.close_conn()
