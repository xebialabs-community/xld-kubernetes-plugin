echo "kubectl delete service ${previousDeployed.name} <#if previousDeployed.namespace??>--namespace  ${previousDeployed.namespace}</#if>"
export KUBERNETES_MASTER=${previousDeployed.container.url}
kubectl delete service ${previousDeployed.name} <#if previousDeployed.namespace??>--namespace  ${previousDeployed.namespace}</#if>
