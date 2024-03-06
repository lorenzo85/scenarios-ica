![Istio logo](https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/istio-logo.svg)

In this scenario you will practice injecting faults to test the resiliency of an application.

Istio allows to set two types of faults between communicating services using [HTTPFaultInjection](https://istio.io/latest/docs/reference/config/networking/virtual-service/#HTTPFaultInjection) 
configuration properties:
* **delay**: simulates network failures, delays, or overloaded upstream services. 
* **abort**: simulates return error codes back to downstream services, simulating a faulty upstream service. 