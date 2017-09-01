<#--

    THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS
    FOR A PARTICULAR PURPOSE. THIS CODE AND INFORMATION ARE NOT SUPPORTED BY XEBIALABS.

-->
<#include "/xldk8s/setup.ftl">
echo "Will execute ${kubectl} delete --filename=${previousDeployed.file.path}"
${kubectl} delete --filename=${previousDeployed.file.path}
<#include "/xldk8s/teardown.ftl">