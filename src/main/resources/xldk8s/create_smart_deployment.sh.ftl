<#--

    THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS
    FOR A PARTICULAR PURPOSE. THIS CODE AND INFORMATION ARE NOT SUPPORTED BY XEBIALABS.

-->
echo "
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: ${deployed.name}
  <#if deployed.namespace??>namespace: ${deployed.namespace}</#if>
  labels:
  <#list deployed.labels?keys as k>
    ${k}: ${deployed.labels[k]}
  </#list>
    application: ${deployedApplication.version.application.name}
    version: v${deployedApplication.version.name}
    environment: ${deployedApplication.environment.name}

spec:
  replicas: ${deployed.replicas}
  template:
    metadata:
      labels:
<#list deployed.labels?keys as k>
        ${k}: ${deployed.labels[k]}
</#list>
        application: ${deployedApplication.version.application.name}
        version: v${deployedApplication.version.name}
        environment: ${deployedApplication.environment.name}
    spec:
      containers:
      - name: ${deployed.name}
        image: ${deployed.image}
        resources:
           requests:
             cpu: ${deployed.cpu}
             memory: ${deployed.memory}
        env:
  <#list deployed.env?keys as k>
        - name: ${k}
          value: '${deployed.env[k]}'
  </#list>
        ports:
  <#list deployed.containerPorts as p>
        - containerPort: ${p}
  </#list>

" > deployment.yaml



cat deployment.yaml

<#include "/xldk8s/setup.ftl">
kubectl apply -f deployment.yaml
