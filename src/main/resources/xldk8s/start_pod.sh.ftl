kubectl scale deployment ${deployed.name} --replicas ${deployed.replicas} <#if deployed.namespace??>--namespace=${deployed.namespace}</#if>
