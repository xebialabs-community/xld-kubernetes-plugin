<#--

    THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS
    FOR A PARTICULAR PURPOSE. THIS CODE AND INFORMATION ARE NOT SUPPORTED BY XEBIALABS.

-->
<#include "/xldk8s/setup.ftl">
echo "${kubectl} create configmap ${deployed.name} --from-file=${deployed.file.path} <#if deployed.namespace??>--namespace  ${deployed.namespace}</#if> --validate=${deployed.container.validate?c}"

${kubectl} create configmap ${deployed.name} --from-file=${deployed.file.path} <#if deployed.namespace??>--namespace  ${deployed.namespace}</#if> --validate=${deployed.container.validate?c}
<#include "/xldk8s/teardown.ftl">
