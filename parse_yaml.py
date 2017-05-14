import ruamel.yaml as yaml

stream = open("deployment.yaml", 'r')
try:
    print(yaml.load(stream))
except yaml.YAMLError as exc:
    print "ERROR"
    print(exc)