<#--

    THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS
    FOR A PARTICULAR PURPOSE. THIS CODE AND INFORMATION ARE NOT SUPPORTED BY XEBIALABS.

-->
echo "kubectl delete namespace ${previousDeployed.namespaceName!previousDeployed.name}"
<#include "/xldk8s/setup.ftl">
kubectl delete namespace ${previousDeployed.namespaceName!previousDeployed.name}
