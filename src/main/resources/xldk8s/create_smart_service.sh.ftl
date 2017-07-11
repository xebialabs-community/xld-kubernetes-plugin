<#--

    THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS
    FOR A PARTICULAR PURPOSE. THIS CODE AND INFORMATION ARE NOT SUPPORTED BY XEBIALABS.

-->
echo "
apiVersion: v1
kind: Service
metadata:
  name: ${deployed.name}
  labels:
  <#list deployed.labels?keys as k>
    ${k}: ${deployed.labels[k]}
  </#list>
    application: ${deployedApplication.version.application.name}
    version: v${deployedApplication.version.name}
    environment: ${deployedApplication.environment.name}
  <#if deployed.namespace??>namespace: ${deployed.namespace}</#if>
spec:
  selector:
<#list deployed.labels?keys as k>
    ${k}: ${deployed.labels[k]}
</#list>
    application: ${deployedApplication.version.application.name}
    version: v${deployedApplication.version.name}
    environment: ${deployedApplication.environment.name}
  ports:
<#list deployed.containerPorts as port>
  - port: ${port}
    targetPort: ${port}
</#list>
" > service.yaml

cat service.yaml
<#include "/xldk8s/setup.ftl">
${kubectl} apply -f service.yaml --validate=${deployed.container.validate?c}
<#include "/xldk8s/teardown.ftl">