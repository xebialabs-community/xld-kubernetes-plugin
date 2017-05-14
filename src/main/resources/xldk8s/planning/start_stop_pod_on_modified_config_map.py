def stop_start_pod(deployed):
    if deployed is None:
        return

    context.addStep(steps.os_script(
        description="Stop Pod %s on %s" % (deployed.name, deployed.container.name),
        order=80,
        script="xldk8s/stop_pod",
        target_host = deployed.container.host,
        freemarker_context={'previousDeployed': deployed}
    ))

    context.addStep(steps.os_script(
        description="Start Pod %s on %s" % (deployed.name, deployed.container.name),
        order=80,
        script="xldk8s/start_pod",
        target_host = deployed.container.host,
        freemarker_context={'deployed': deployed}
    ))


def pods(modify_config_map, noop_delta_pod):
    candidates = []
    for delta_v in modify_config_map:
        for delta in noop_delta_pod:
            pod = delta.deployed
            if pod.volumes is None:
                continue
            for v in pod.volumes:
                if v.configMapName == delta_v.deployed.name or v.configMapName == delta_v.previous.name:
                    candidates.append(pod)
    return set(candidates)


modify_config_map = filter(
    lambda delta: delta.operation == "MODIFY" and (delta.deployedOrPrevious.type == "kubernetes.ConfigMapFolder"),
    deltas.deltas)

print "--- modify_config_map %s " % modify_config_map

noop_delta_pod = filter(
    lambda delta: delta.operation == "NOOP" and delta.deployedOrPrevious.type == "kubernetes.Pod",
    deltas.deltas)

print "--- noop_delta_pod %s " % noop_delta_pod

candidates = pods(modify_config_map, noop_delta_pod)

map(stop_start_pod, candidates)
