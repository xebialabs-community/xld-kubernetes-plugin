echo "kubectl delete deployment ${previousDeployed.podName!previousDeployed.name} <#if previousDeployed.namespace??>--namespace  ${previousDeployed.namespace}</#if>"
kubectl delete deployment ${previousDeployed.podName!previousDeployed.name} <#if previousDeployed.namespace??>--namespace  ${previousDeployed.namespace}</#if>
