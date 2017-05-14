from kubernetes import client,config

client.Configuration().host="http://localhost:8080"

v1=client.CoreV1Api()

v1.list_node()



v1.list_node().items[0].metadata.name






import socket
socket.SOL_TCP = 6
import sys
from kubernetes import client, config
import traceback

print "----- SOCKET...."
try:
    socket.SOL_TCP  # if socket.SOL_TCP does not exist then jython raise AttributeError

    print "load kube config......"
    config.load_kube_config()

    v1 = client.CoreV1Api()
    print("Listing pods with their IPs:")
    ret = v1.list_pod_for_all_namespaces(watch=False)
    for i in ret.items:
        print("%s\t%s\t%s" %
              (i.status.pod_ip, i.metadata.namespace, i.metadata.name))

except:
    #socket.SOL_TCP = 6  # workaround for missing var in jython import
    print "Unexpected error:", sys.exc_info()[0]
    print(traceback.format_exc())
