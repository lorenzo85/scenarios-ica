## Congratulations!

You have completed the **Fault Injection** scenario.

## What You Learned

- How to inject HTTP delays into service-to-service communication to simulate latency
- How to inject HTTP abort faults (e.g., 503 errors) to test failure handling in services
- How upstream timeout settings interact with injected delays to expose resilience gaps
- How to observe the effect of faults through application responses and `curl` output
- Why fault injection is a safer alternative to chaos testing in production environments

## Key Istio Resources Used

- `VirtualService` — defines fault injection rules (`delay` and `abort` under the `fault` block)
- `DestinationRule` — provides service subsets targeted by the virtual service
- `HTTPFaultInjection` — the fault specification within a VirtualService route

**Official Istio Docs:** [Fault Injection](https://istio.io/latest/docs/tasks/traffic-management/fault-injection/)
