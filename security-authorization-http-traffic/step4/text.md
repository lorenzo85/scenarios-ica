You are now going to set up a set of authorization policies for pods
to pods communication between the `booking-service` and the `notification-service`.

Moreover, you will configure the `notification-service` to accept *POST* requests only if the *source pod* has service
account named `booking-service-account`.

You will also configure an authorization policy to allow any incoming **POST** request to the `booking-service`,
so that a booking can be placed by external clients.


First, create a service account resource named `booking-service-account`
and update the `booking-service-v1` deployment to use this service account in the pods spec.

Use the following configuration properties:

*service account:*
* name: `booking-service-account`
* namespace: `default`

*booking-service-v1 deployment pods spec:*
- serviceAccountName: `booking-service-account`


<br>
<details><summary>Tip</summary>

```bash
kubectl create serviceaccount // TODO
```{{copy}}

```bash
kubectl edit deploy booking-service-v1
```{{copy}}
</details>


<br>
<details><summary>Solution</summary>

```bash
kubectl create serviceaccount booking-service-account
```{{copy}}

```bash
kubectl edit deploy booking-service-v1
```{{copy}}

Edit the booking-service-v1 deployment definition to add `booking-service-account`:
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  ...
  name: booking-service-v1
  namespace: default
spec:
  template:
    metadata:
      labels:
        app: booking-service
    spec:
      serviceAccountName: booking-service-account //Add the service account to the deployment
      containers:
      ...
```{{copy}}
</details>
