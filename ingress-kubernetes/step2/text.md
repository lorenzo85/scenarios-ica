Ingress traffic using a Kubernetes Ingress resource is configured with
a Kubernetes [IngressClass](https://kubernetes.io/docs/concepts/services-networking/ingress/#ingress-class)
and an [Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/) resource.

A Kubernetes Ingress class is backed by different implementations called controllers. An example is the Istio ingress controller.
An [IngressClass](https://kubernetes.io/docs/concepts/services-networking/ingress/#ingress-class)
resource contains the name of the controller and additional configurations such as the 
scope and if it is the default class.  

Create an ingress class resource named `istio` in the `default` namespace using following configuration properties:

*ingress class:*
* name: `istio`
* namespace: `default`
* controller: `istio.io/ingress-controller`

<br>
<details><summary>Tip</summary>

```plain
apiVersion: networking.k8s.io/v1
kind: IngressClass
metadata:
  name: // TODO
spec:
  controller: // TODO
```{{copy}}
</details>

<br>
<details><summary>Solution</summary>

```plain
apiVersion: networking.k8s.io/v1
kind: IngressClass
metadata:
  name: istio
spec:
  controller: istio.io/ingress-controller
```{{copy}}
</details>