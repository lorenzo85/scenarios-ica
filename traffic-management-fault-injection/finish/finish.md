## Congratulations!

You have completed the **Fault Injection** scenario.

## What You Learned

- How to inject HTTP delays into service-to-service communication to simulate latency
- How to inject HTTP abort faults (e.g., 503 errors) to test failure handling in services
- How fault injection rules are scoped per user via HTTP header matching in a `VirtualService`
- How upstream timeout settings interact with injected delays to expose resilience gaps
- How to observe the effect of faults through application responses and `curl` output
- Why fault injection is a safer alternative to chaos testing in production environments

## Key Istio Resources Used

- `VirtualService` — defines fault injection rules (`delay` and `abort` under the `fault` block)
- `DestinationRule` — provides service subsets targeted by the virtual service
- `HTTPFaultInjection` — the fault specification within a VirtualService route

## Next Steps

- **Request Routing** — control which version of a service receives traffic before adding faults
- **Traffic Shifting** — combine gradual rollouts with fault injection for canary validation
- **Circuit Breaking** — automatically stop sending traffic to failing service instances
- Explore [fault injection reference](https://istio.io/latest/docs/reference/config/networking/virtual-service/#HTTPFaultInjection)

**Official Istio Docs:** [Fault Injection](https://istio.io/latest/docs/tasks/traffic-management/fault-injection/)
