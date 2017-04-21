echo "
apiVersion: ${deployed.apiVersion}
kind: ${deployed.kind}
metadata:
  name: ${deployed.namespaceName!deployed.name}

" > namespace.yaml

cat namespace.yaml
kubectl apply -f namespace.yaml
