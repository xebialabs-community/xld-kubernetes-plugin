from kubernetes import client,config

client.Configuration().host="http://localhost:8080"

v1=client.CoreV1Api()

v1.list_node()



v1.list_node().items[0].metadata.name

