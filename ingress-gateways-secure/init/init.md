
![Istio logo](https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/istio-logo.svg)

In this scenario, you will practice configuring Istio to secure ingress traffic by using an ingress `Gateway` resource.

A secure ingress `Gateway` serves the purpose of exposing a service beyond the boundaries of the service mesh over HTTPS/TLS.

You will also extend the `Gateway` resource configuration to support **mutual TLS (mTLS)** between the server and the client.

With standard TLS, only the server presents a certificate to prove its identity to the client. With mutual TLS, both the client and the server present certificates, providing two-way authentication. This is especially useful for machine-to-machine communication where you need to enforce that only trusted clients can reach your service.

## What you will learn

- How to configure a `Gateway` resource with HTTPS/TLS to secure inbound traffic
- How to create and reference Kubernetes `Secret` resources containing TLS certificates and private keys
- How to extend a TLS `Gateway` to require mutual TLS (mTLS) from clients
- How to test HTTPS and mTLS connections using `curl` with the appropriate certificate flags
- How Istio handles certificate rotation and secret management for the ingress gateway

## Prerequisites

- Basic Kubernetes knowledge (pods, services, deployments, secrets)
- Familiarity with `kubectl`
- Understanding of Istio `Gateway` and `VirtualService` resources (covered in the Ingress Gateways scenario)
- Basic knowledge of TLS concepts (certificates, private keys, certificate authorities)
