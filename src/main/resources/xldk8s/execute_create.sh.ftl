export KUBERNETES_MASTER=${deployed.container.url}
kubectl create --filename=${deployed.file.path}