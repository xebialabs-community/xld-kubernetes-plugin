<#--

    THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS
    FOR A PARTICULAR PURPOSE. THIS CODE AND INFORMATION ARE NOT SUPPORTED BY XEBIALABS.

-->
echo "
apiVersion: ${deployed.apiVersion}
kind: ${deployed.kind}
metadata:
  name: ${deployed.namespaceName!deployed.name}

" > namespace.yaml

cat namespace.yaml
cp namespace.yaml /tmp/namespace.yaml

<#include "/xldk8s/setup.ftl">
kubectl apply -f namespace.yaml --validate=${deployed.container.validate?c}
