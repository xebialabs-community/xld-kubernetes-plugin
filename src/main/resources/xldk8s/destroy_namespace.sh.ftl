echo "kubectl delete namespace ${previousDeployed.namespaceName!previousDeployed.name}"
export KUBERNETES_MASTER=${previousDeployed.container.url}
kubectl delete namespace ${previousDeployed.namespaceName!previousDeployed.name}
