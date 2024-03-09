
![Istio logo](https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/istio-logo.svg)

In this scenario, you will practice configuring Istio Gateway to perform TLS pass-through, 
instead of TLS termination on incoming requests.

TLS pass-through is useful for use cases where services **within** the mesh need to 
securely serve traffic over HTTPs for security reasons.