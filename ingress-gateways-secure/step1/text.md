This scenario configures a **secure** Istio ingress `Gateway` using TLS certificates, then extends it to support **mutual TLS (mTLS)** between the client and the gateway.

| Protocol | Description |
|----------|-------------|
| **TLS (one-way)** | The server presents a certificate; the client verifies it |
| **mTLS (two-way)** | Both server and client present certificates; mutual verification |

The following service is pre-deployed:

| Service | Description |
|---------|-------------|
| `booking-service-v1` | A sample booking API (HTTP on port 8080) |

Check the running pods and services and wait until they are all in `Running` status:

```bash
kubectl get pod,service -L app,version
```{{exec}}

Verify that the `booking-service` is reachable from within the cluster (internal cluster DNS):

```bash
kubectl exec -it tester -- \
    bash -c 'curl -s http://booking-service/bookings; \
    echo;'
```{{exec}}

In the next steps you will:
1. Generate a self-signed TLS certificate for the gateway
2. Store the certificate as a Kubernetes `Secret`
3. Configure an Istio `Gateway` to terminate TLS
4. Extend the `Gateway` to require client certificates (mTLS)
