![Istio logo](https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/istio-logo.svg)

Istio's traffic shifting allows you to shift traffic from one version of a service to another.

Traffic shifting proves beneficial in scenarios employing a **canary rollout** strategy for deploying features to production.

This strategy involves initially releasing a software update to a limited user base, allowing thorough testing and acceptance. Upon successful validation, the update is progressively released to all users; otherwise, a rollback is initiated.

In this scenario you will practice traffic shifting by configuring a series of routing rules that redirect a percentage of traffic from one destination to another.

## What you will learn

- How to create a `DestinationRule` that defines version subsets for a service
- How to configure a `VirtualService` with weighted routes for a 90%/10% traffic split
- How to observe the effect of weighted routing by running multiple requests
- How to progressively shift traffic to 100% on the new version to complete a canary rollout
- How weighted Istio routing compares to Kubernetes replica-count-based traffic distribution

## Prerequisites

- Basic Kubernetes knowledge (pods, services, deployments)
- Familiarity with `kubectl`
- Basic understanding of `VirtualService` and `DestinationRule` resources (covered in the Request Routing scenario)
