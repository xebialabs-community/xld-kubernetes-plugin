# xld-kubernetes-plugin

<img src="https://kubernetes.io/images/favicon.png" width="200" height="200"/>

# Overview #

This plugin is a XL Deploy plugin that adds capability for deploying on a [Kubernetes Cluster](https://kubernetes.io/) (including Openshift v3+)
It manages the following items
* Deployment,
* Pod,
* Namespace,
* Service,
* ConfigMap,

# CI status #

[![Build Status][xld-kubernetes-plugin-travis-image]][xld-kubernetes-plugin-travis-url]

[xld-kubernetes-plugin-travis-image]: https://travis-ci.org/xebialabs-community/xld-kubernetes-plugin.svg?branch=master
[xld-kubernetes-plugin-travis-url]: https://travis-ci.org/xebialabs-community/xld-kubernetes-plugin

# Installation #

Place the plugin XLDP file into your `SERVER_HOME/plugins` directory.

# Dependencies

* XL Deploy 6.0+
* Overthere-py library (bundled in the xldp file)

# Sample Applications #

* Guestbook: in the sample/ folder, you'll find the famous Guestbook application packaged for XLDeploy [sample/deployit-manifest.xml](sample/deployit-manifest.xml)
* [PetDocker](https://github.com/bmoussaud/xld-petclinic-docker) The famous petportal application packaged using Docker Containers.




