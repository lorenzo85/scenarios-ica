![Istio logo](https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/istio-logo.svg)

Istio's circuit-breaking allows to limit the impact of failures, latency spikes, and other network
issues that may occur between requests within services deployed in a Kubernetes cluster.

Circuit breaking is an important pattern for developing resilient microservice applications,
limiting the propagation of failures and preventing cascading impacts on other services
throughout the application.

In this scenario, you will configure circuit-breaking rules and then test the setup by intentionally
triggering the circuit breaker, simulating a controlled failure.
