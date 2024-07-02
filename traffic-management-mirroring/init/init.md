
![Istio logo](https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/istio-logo.svg)


In this scenario you will practice configuring Istio to mirror traffic directed
to a service, to another service.

Traffic mirroring allows to publish changes to production with as little risk as
possible, by sending a copy of live traffic to a mirrored service.

The mirrored traffic happens out of band of the critical request path for the
primary service, and it is "fire and forget", meaning that the responses are
discarded.
