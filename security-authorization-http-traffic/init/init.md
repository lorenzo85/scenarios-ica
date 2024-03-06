
![Istio logo](https://raw.githubusercontent.com/lorenzo85/scenarios-ica/main/istio-logo.svg)


In this scenario you will practice configuring Istio to set up access control for workloads within the mesh.

You will start with an `allow-nothing` authorization policy which denies all incoming requests to the workloads,
you will then deploy more policies to incrementally enable HTTP access permissions for and between the workloads.