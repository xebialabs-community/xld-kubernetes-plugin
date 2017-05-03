kubectl scale deployment ${previousDeployed.name} --replicas 0 <#if previousDeployed.namespace??>--namespace=${previousDeployed.namespace}</#if>
