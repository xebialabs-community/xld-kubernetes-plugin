echo "kubectl delete deployment ${previousDeployed.podName!previousDeployed.name} <#if previousDeployed.namespace??>--namespace  ${previousDeployed.namespace}</#if>"
export KUBERNETES_MASTER=${previousDeployed.container.url}
kubectl delete deployment ${previousDeployed.podName!previousDeployed.name} <#if previousDeployed.namespace??>--namespace  ${previousDeployed.namespace}</#if>
