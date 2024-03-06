Ingress traffic using a Kubernetes Ingress resource is configured using:
an [IngressClass](https://kubernetes.io/docs/concepts/services-networking/ingress/#ingress-class)
and an Isto's [Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/) resource.

The Kubernetes Ingress class can be implemented by different controllers, such as the Istio ingress controller.
An [IngressClass](https://kubernetes.io/docs/concepts/services-networking/ingress/#ingress-class)
resource contains the name of the controller and additional configurations such as the 
scope and if it is the default class.  

Create an ingress class resource named `istio` in the `default` namespace using following configuration properties:

*ingress class:*
- name: `istio`
- controller: `istio.io/ingress-controller`

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