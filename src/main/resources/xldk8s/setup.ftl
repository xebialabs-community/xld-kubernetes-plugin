# begin setup.ftl

export KUBERNETES_MASTER=${(deployed.container.url)!(previousDeployed.container.url)}

# end setup.ftl

