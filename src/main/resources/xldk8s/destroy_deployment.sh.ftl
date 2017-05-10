echo "kubectl delete deployment ${previousDeployed.podName!previousDeployed.name} <#if previousDeployed.namespace??>--namespace  ${previousDeployed.namespace}</#if>"
<#include "/xldk8s/setup.ftl">
kubectl delete deployment ${previousDeployed.podName!previousDeployed.name} <#if previousDeployed.namespace??>--namespace  ${previousDeployed.namespace}</#if>
