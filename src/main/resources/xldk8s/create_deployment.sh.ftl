echo "
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: ${deployed.podName!deployed.name}
  <#if deployed.namespace??>namespace: ${deployed.namespace}</#if>
  labels:
  <#list deployed.labels?keys as k>
    ${k}: ${deployed.labels[k]}
  </#list>

spec:
  replicas: ${deployed.replicas}
  strategy:
    <#if deployed.strategyType == "RollingUpdate">
      <#if deployed.rollingUpdateMaxSurge?? || deployed.rollingUpdateMaxUnavailable ?? >
      ${deployed.strategyType}:
      </#if>
        <#if deployed.rollingUpdateMaxSurge??> maxSurge: ${deployed.rollingUpdateMaxSurge}</#if>
        <#if deployed.rollingUpdateMaxUnavailable??> maxUnavailable: ${deployed.rollingUpdateMaxUnavailable}</#if>
    </#if>
  selector:
      <#if deployed.selectorMatchLabels?size !=0 >matchLabels:</#if>
<#list deployed.selectorMatchLabels?keys as k>
        ${k}: ${deployed.selectorMatchLabels[k]}
</#list>
  template:
    metadata:
      labels:
<#list deployed.labels?keys as k>
        ${k}: ${deployed.labels[k]}
</#list>
      annotations:
<#list deployed.annotations?keys as k>
        ${k}: ${deployed.annotations[k]}
</#list>
    spec:
      containers:
<#list deployed.containers as c>
      - name: ${c.name}
        image: ${c.image}
        imagePullPolicy: ${c.imagePullPolicy}
        resources:
          requests:
  <#list c.requests?keys as k>
            ${k}: ${c.requests[k]}
  </#list>
        env:
  <#list c.env?keys as k>
        - name: ${k}
          value: '${c.env[k]}'
  </#list>
        command: [${c.command?join(",")}]
        args: [${c.args?join(",")}]
        ports:
  <#list c.ports as p>
        - containerPort: ${p.containerPort}
  </#list>
  <#list c.securityContext as s>
        securityContext:
          capabilities:
            drop:
    <#list s.dropCapabilities as d>
              - ${d}
    </#list>
            add:
    <#list s.addCapabilities as a>
              - ${a}
    </#list>
          readOnlyRootFilesystem: ${s.readOnlyRootFilesystem?c}
          <#if s.runAsUser??>runAsNonRoot: ${s.runAsNonRoot?c}</#if>
          <#if s.runAsUser??>runAsUser: ${s.runAsUser}</#if>
  </#list>
  <#list c.probes as p>
        ${p.name}:
          httpGet:
            path: ${p.httpget_path}
            port: ${p.httpget_port}
          initialDelaySeconds: ${p.initialDelaySeconds}
          periodSeconds: ${p.periodSeconds}
  </#list>
        volumeMounts:
  <#list c.volumeMounts as v>
        - mountPath: ${v.mountPath}
          name: ${v.name}
  </#list>
</#list>
      volumes:
<#list deployed.volumes as v>
      - name: ${v.name}
      <#if v.emptyDir>
        <#if v.emptyDirMedium??>
        emptyDir:
            medium: ${v.emptyDirMedium}
        </#if>
      </#if>
      <#if v.configMapName??>
        configMap:
          name: ${v.configMapName}
      </#if>
</#list>
" > deployment.yaml

cp ./deployment.yaml  /tmp/x.yaml

cat deployment.yaml
kubectl apply -f deployment.yaml
