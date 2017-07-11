<#--

    THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS
    FOR A PARTICULAR PURPOSE. THIS CODE AND INFORMATION ARE NOT SUPPORTED BY XEBIALABS.

-->
K8S_EXIT_CODE=$?
echo "close access to /teardown.${(deployed.container.type)!(previousDeployed.container.type)}.ftl"
<#include "/xldk8s/teardown.${(deployed.container.type)!(previousDeployed.container.type)}.ftl">

exit $K8S_EXIT_CODE




