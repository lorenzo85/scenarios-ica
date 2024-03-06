
![Istio logo](https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/istio-logo.svg)


In this scenario you will practice configuring Istio to perform TLS origination for outgoing 
traffic to an external service. 

TLS origination is useful when the original internal traffic is HTTP, while the target
service requires traffic to be encrypted with HTTPs instead.

With TLS origination, this requirement can be implemented without changing the application.