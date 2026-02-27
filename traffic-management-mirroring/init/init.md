
![Istio logo](https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/istio-logo.svg)


In this scenario you will practice configuring Istio to mirror traffic directed to a service, to another service.

Traffic mirroring allows you to publish changes to production with as little risk as possible, by sending a copy of live traffic to a mirrored service.

The mirrored traffic happens out of band of the critical request path for the primary service, and it is "fire and forget", meaning that the responses are discarded.

This pattern is particularly useful for validating a new version of a service against real production traffic before fully cutting over. Because responses from the mirror are ignored, any bugs or slowdowns in the new version have no impact on the end user.

Traffic mirroring in Istio is configured in a `VirtualService` using the `mirror` and `mirrorPercentage` fields.

## What you will learn

- How to configure traffic mirroring in a `VirtualService` to shadow live requests to a second service
- How to control the percentage of traffic that is mirrored using `mirrorPercentage`
- How to verify that mirrored traffic is received by the shadow service without affecting primary responses
- How traffic mirroring compares to traffic shifting and when to prefer each approach
- How to use mirroring to safely validate a new service version against real production workloads

## Prerequisites

- Basic Kubernetes knowledge (pods, services, deployments)
- Familiarity with `kubectl`
- Understanding of `VirtualService` resources (covered in the Request Routing scenario)
