<#include "/xldk8s/setup.ftl">
kubectl scale deployment ${deployed.name} --replicas ${deployed.replicas} <#if deployed.namespace??>--namespace=${deployed.namespace}</#if>
