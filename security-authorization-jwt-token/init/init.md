
![Istio logo](https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/istio-logo.svg)


In this scenario you will practice configuring Istio authorization policy to enforce access 
to a workload based on a JSON Web Token (JWT). 

An Istio authorization policy is configured using an action (e.g. ALLOW, DENY, CUSTOM) and one 
or more request principals defined in the JWT token.