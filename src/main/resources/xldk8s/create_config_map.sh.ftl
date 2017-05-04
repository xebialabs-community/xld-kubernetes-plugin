export KUBERNETES_MASTER=${deployed.container.url}
kubectl create configmap ${deployed.name} --from-file=${deployed.file.path} <#if deployed.namespace??>--namespace  ${deployed.namespace}</#if>
