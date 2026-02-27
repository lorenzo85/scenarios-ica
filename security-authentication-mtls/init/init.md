
![Istio logo](https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/istio-logo.svg)


By default, Istio employs mTLS for secure communication between pods utilizing Istio proxies installed as sidecars. The mTLS constraint is relaxed for transmissions of plain text traffic to and from workloads lacking Istio sidecar proxies.

In this scenario, you will practice configuring Istio mutual TLS (mTLS) to:
- enforce cluster-wide mTLS
- enforce namespace-wide mTLS
- enforce workloads-wide mTLS though labels and selectors.

**Understanding Istio mTLS modes**

Istio supports two mTLS modes configured through `PeerAuthentication` resources:

- **STRICT**: only mTLS traffic is accepted. Plain text connections are rejected. Use this when all workloads in scope have Istio sidecar proxies injected.
- **PERMISSIVE**: both mTLS and plain text traffic are accepted. This is the default and is useful during gradual migration to a fully mTLS mesh.

`PeerAuthentication` resources can be scoped at three levels: the entire mesh (by deploying the resource in the `istio-system` namespace), a specific namespace, or individual workloads (using label selectors).

## What you will learn

- How Istio's automatic mTLS works and the difference between `STRICT` and `PERMISSIVE` modes
- How to enforce cluster-wide mTLS using a mesh-level `PeerAuthentication` policy
- How to enforce namespace-scoped mTLS using a namespace-level `PeerAuthentication` policy
- How to enforce mTLS for specific workloads using label selectors in a `PeerAuthentication` policy
- How to verify that plain text connections are rejected when `STRICT` mode is active

## Prerequisites

- Basic Kubernetes knowledge (pods, services, deployments, namespaces)
- Familiarity with `kubectl`
- Basic understanding of TLS and mutual TLS concepts
- Familiarity with Istio sidecar injection
