echo "kubectl delete namespace ${previousDeployed.namespaceName!previousDeployed.name}"
<#include "/xldk8s/setup.ftl">
kubectl delete namespace ${previousDeployed.namespaceName!previousDeployed.name}
