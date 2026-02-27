
![Istio logo](https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/istio-logo.svg)

In this scenario, you will practice configuring Istio ingress traffic by using an ingress `Gateway` resource.

A `Gateway` serves the purpose of exposing a service beyond the boundaries of the service mesh and provides more extensive customization and flexibility compared to a Kubernetes `Ingress` resource.

Furthermore, a `Gateway` enables the application of Istio features, such as monitoring and routing rules, to incoming traffic entering the cluster.

An Istio `Gateway` resource describes the ports, protocols, and TLS settings for the load balancer operating at the edge of the mesh. It is always paired with a `VirtualService` that defines how matching traffic is forwarded to services inside the mesh.

## What you will learn

- How to create an Istio `Gateway` resource to expose a service outside the mesh over HTTP
- How to bind a `VirtualService` to a `Gateway` to define forwarding rules for inbound traffic
- How `Gateway` resources differ from Kubernetes `Ingress` resources and the advantages they provide
- How to verify that external traffic is correctly routed to services inside the mesh
- How to use the Istio ingress gateway's external IP or NodePort to reach deployed services

## Prerequisites

- Basic Kubernetes knowledge (pods, services, deployments)
- Familiarity with `kubectl`
- Understanding of `VirtualService` resources (covered in the Request Routing scenario)
