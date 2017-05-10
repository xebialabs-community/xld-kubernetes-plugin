echo "kubectl delete service ${previousDeployed.name} <#if previousDeployed.namespace??>--namespace  ${previousDeployed.namespace}</#if>"
<#include "/xldk8s/setup.ftl">
kubectl delete service ${previousDeployed.name} <#if previousDeployed.namespace??>--namespace  ${previousDeployed.namespace}</#if>
