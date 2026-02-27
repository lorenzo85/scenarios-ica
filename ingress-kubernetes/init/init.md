
![Istio logo](https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/istio-logo.svg)


In this scenario, you will practice configuring Istio to expose a service outside the mesh with a Kubernetes `Ingress` resource using Istio's ingress controller.

You will configure a Kubernetes `Ingress` resource to expose a service first on HTTP and then on HTTPS protocol.

**Kubernetes Ingress vs Istio Gateway**

Kubernetes provides its own `Ingress` resource as a standard way to expose HTTP and HTTPS routes from outside the cluster to services within it. Istio can act as the controller for these `Ingress` resources, handling the actual traffic routing through the ingress gateway pods.

While Kubernetes `Ingress` offers a simpler and more portable API, it has significant limitations compared to Istio's native `Gateway` resource — it lacks support for Istio-specific features such as traffic shifting, fault injection, or fine-grained observability without additional configuration.

## What you will learn

- How Kubernetes `Ingress` resources differ from Istio `Gateway` resources and the trade-offs of each approach
- How to configure Istio as the ingress controller for a Kubernetes `Ingress` resource
- How to expose a service over HTTP using a Kubernetes `Ingress` resource with Istio
- How to add TLS termination to a Kubernetes `Ingress` resource using a Kubernetes `Secret`
- When to prefer the Kubernetes `Ingress` API versus the native Istio `Gateway` API

## Prerequisites

- Basic Kubernetes knowledge (pods, services, deployments, secrets, ingress)
- Familiarity with `kubectl`
- Basic knowledge of TLS concepts (certificates, private keys)
