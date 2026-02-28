<div align="center">
  <img src="istio-logo.svg" alt="Istio Logo" width="120"/>

  # Killercoda Istio ICA Scenarios

  Interactive, hands-on scenarios for the [Istio Certified Associate (ICA)](https://training.linuxfoundation.org/certification/istio-certified-associate-ica/) exam, available at **[killercoda.com/ica](https://killercoda.com/lorenzo-g)**

  ![License](https://img.shields.io/badge/license-MIT-blue)
</div>

---

## About

This repository contains all the Killercoda scenarios that help you practise the key Istio skills tested in the ICA certification exam. Each scenario runs on a live Kubernetes cluster directly in your browser — no local setup required.

## Scenarios

### 🚦 Traffic Management
| Scenario | Description |
|----------|-------------|
| [Request Routing](traffic-management-request-routing) | Route requests to different service versions based on HTTP headers, URI prefix, and query parameters |
| [Traffic Shifting](traffic-management-traffic-shifting) | Gradually shift traffic between service versions using weighted routing for a canary release |
| [Fault Injection](traffic-management-fault-injection) | Inject delays and HTTP abort faults to test the resiliency of an application |
| [Circuit Breaking](traffic-management-circuit-breaking) | Configure circuit breaking using connection pool limits and outlier detection |
| [Traffic Mirroring](traffic-management-mirroring) | Send a copy of live traffic to a mirrored service for shadow testing |

### 🔀 Ingress
| Scenario | Description |
|----------|-------------|
| [Ingress Gateways](ingress-gateways) | Expose HTTP services using an Istio Gateway and VirtualService |
| [Ingress Gateways Secure](ingress-gateways-secure) | Configure an Istio Gateway with TLS and mutual TLS (mTLS) for secure ingress traffic |
| [Ingress Gateway no TLS Termination](ingress-gateway-no-tsl-termination) | Configure TLS pass-through (SNI passthrough) instead of TLS termination |
| [Ingress Kubernetes](ingress-kubernetes) | Expose services using a Kubernetes Ingress resource managed by Istio's ingress controller |

### 🚪 Egress
| Scenario | Description |
|----------|-------------|
| [Accessing External Services](egress-external-services-access) | Use ServiceEntry to provide controlled access to external services |
| [External Services TLS Origination](egress-external-services-tls-origination) | Perform TLS origination for outbound traffic to an external service |
| [Egress Gateways](egress-gateways) | Route external traffic through a dedicated egress gateway |
| [Egress Gateway TLS Origination](egress-gateways-tls-origination) | Combine egress gateway routing with TLS origination for external services |

### 🔒 Security
| Scenario | Description |
|----------|-------------|
| [Authentication mTLS](security-authentication-mtls) | Enforce mutual TLS using PeerAuthentication at cluster, namespace, and workload scope |
| [Authorization HTTP Traffic](security-authorization-http-traffic) | Configure AuthorizationPolicy to control HTTP access between workloads |
| [Authorization JWT Token](security-authorization-jwt-token) | Enforce JWT-based access control using RequestAuthentication and AuthorizationPolicy |

### 📊 Observability
| Scenario | Description |
|----------|-------------|
| [Kiali](kiali) | Visualize the Istio service mesh topology, traffic flow, and configuration health using Kiali |

### 🛠️ Other
| Scenario | Description |
|----------|-------------|
| [Istio Installation](istio-installation-istioctl) | Install, configure, and uninstall Istio using the istioctl CLI tool |
| [Istio Ambient Mode](istio-installation-ambient) | Install Istio in ambient mode, enroll workloads into the mesh without sidecars, and verify transparent mTLS through ztunnel |
| [Playground](playground) | Free-form environment with Istio pre-installed to explore at your own pace |

---

## Reporting Issues

Found a bug or an error in a scenario? Please [open an issue](../../issues) on this repository and include:
- The scenario name and step where the problem occurs
- A description of the expected vs actual behaviour

## Contribute

Would you like to help others by changing, modifying or creating scenarios?

Follow these steps and let us know on [support](https://killercoda.com/support) if you have any questions:

1. Fork this repository
2. Add your fork to your Killercoda account on [killercoda.com/creator/repository](https://killercoda.com/creator/repository) ([help](https://killercoda.com/creators/get-started))
3. Create or modify scenarios and test your changes ([docs](https://killercoda.com/creators)) ([examples](https://github.com/killercoda/scenario-examples))
4. Create a PR from your fork into this repository

## Contact

[killercoda.com/support](https://killercoda.com/support)
