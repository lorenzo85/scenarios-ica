![Istio logo](https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/istio-logo.svg)

Isto's traffic shifting allows to shift traffic from one version of a service to another.

Traffic shifting proves beneficial in scenarios employing a canary rollout strategy for deploying features to production. 

This strategy involves initially releasing a software update to a limited user base, allowing thorough testing and acceptance. 
Upon successful validation, the update is progressively released to all the users; otherwise, a rollback is initiated.

In this scenario you will practice traffic shifting by configuring a series of routing rules that redirect 
a percentage of traffic from one destination to another.