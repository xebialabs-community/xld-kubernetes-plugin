echo "kubectl delete configmap ${previousDeployed.name} <#if previousDeployed.namespace??>--namespace  ${previousDeployed.namespace}</#if>"
export KUBERNETES_MASTER=${previousDeployed.container.url}
kubectl delete configmap ${previousDeployed.name} <#if previousDeployed.namespace??>--namespace  ${previousDeployed.namespace}</#if>
