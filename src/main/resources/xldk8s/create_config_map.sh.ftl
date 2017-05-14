<#include "/xldk8s/setup.ftl">
kubectl create configmap ${deployed.name} --from-file=${deployed.file.path} <#if deployed.namespace??>--namespace  ${deployed.namespace}</#if>
