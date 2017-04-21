import json
import sys
from com.xebialabs.deployit.plugin.python import PythonVarsConverter



def ci_to_dict(ci):
    return {'type':str(ci.getType()),'name':ci.name, 'id':ci.id}

print"-----"
print deployed
print deployed.class
print  PythonVarsConverter.javaToPython(deployed.container.host.connection,{'deployed':d},False, None, False)
print"-----"
print  json.dumps(deployed, default=lambda o: ci_to_dict(o), sort_keys=True, indent=4)
sys.exit(1)
