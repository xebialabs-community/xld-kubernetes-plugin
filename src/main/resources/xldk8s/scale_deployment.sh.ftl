<#include "/xldk8s/setup.ftl">
echo "kubectl scale deployment ${deployed.name} --replicas ${deployed.replicas} <#if deployed.namespace??>--namespace=${deployed.namespace}</#if>"
kubectl scale deployment ${deployed.name} --replicas ${deployed.replicas} <#if deployed.namespace??>--namespace=${deployed.namespace}</#if>
