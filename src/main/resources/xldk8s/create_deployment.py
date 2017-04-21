import sys
from jinja2 import Template

tmpl = Template(u'''\
    init_config: {}
    instances:
         - host: {{ IP }}
           username: {{ username }}
           password: {{ password }}
''')

print tmpl.render(
    IP=u"1.2.3.4",
    username=u"Username",
    password=u"Password"
)
print "--------------------------------"
tmpl = Template(u'''\
    init_config: {}
    instances:
         - host: {{ deployed.name }}
           username: {{ deployed.kind }}
           password: {{ deployed.replicas }}
''')

print tmpl.render(deployed=deployed)
sys.exit(1)
