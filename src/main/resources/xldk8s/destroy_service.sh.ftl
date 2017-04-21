echo "kubectl delete service ${previousDeployed.name} <#if previousDeployed.namespace??>--namespace  ${previousDeployed.namespace}</#if>"
kubectl delete service ${previousDeployed.name} <#if previousDeployed.namespace??>--namespace  ${previousDeployed.namespace}</#if>
