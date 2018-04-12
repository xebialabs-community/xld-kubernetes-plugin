<#--

    THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS
    FOR A PARTICULAR PURPOSE. THIS CODE AND INFORMATION ARE NOT SUPPORTED BY XEBIALABS.

-->
<#include "/xldk8s/setup.ftl">
echo "${kubectl} create secret tls ${deployed.tlsSecretname} --cert=${deployed.file.path}/${deployed.serverCrt} --key=${deployed.file.path}/${deployed.serverKey}  --namespace=${deployed.namespace}"
${kubectl} create secret tls ${deployed.tlsSecretname} --cert=${deployed.file.path}/${deployed.serverCrt} --key=${deployed.file.path}/${deployed.serverKey}  --namespace=${deployed.namespace}
<#include "/xldk8s/teardown.ftl">
