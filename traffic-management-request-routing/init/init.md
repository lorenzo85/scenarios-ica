![Istio logo](https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/istio-logo.svg)

Isto's request routing allows to control traffic flow 
between services deployed within a Kubernetes cluster.

Request routing can be used for A/B testing. For instance, it enables
the testing of new features by directing a subset of user requests that
meet specific criteria to deployments with the latest functionalities.

This approach facilitates the observation of telemetry data and user feedback,
based on real usage data and user reactions.

Examples of request match criteria that can be defined in Istio include:
- HTTP Header
- URL Path Prefix
- Query Parameters

Isto's request match criteria are defined using an [HTTPMatchRequest](https://istio.io/latest/docs/reference/config/networking/virtual-service/#HTTPMatchRequest)
object in a [VirtualService](https://istio.io/latest/docs/reference/config/networking/virtual-service/) 
resource.