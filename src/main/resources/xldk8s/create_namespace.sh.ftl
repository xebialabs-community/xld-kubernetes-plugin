echo "
apiVersion: ${deployed.apiVersion}
kind: ${deployed.kind}
metadata:
  name: ${deployed.namespaceName!deployed.name}

" > namespace.yaml

cat namespace.yaml
export KUBERNETES_MASTER=${deployed.container.url}
kubectl apply -f namespace.yaml
