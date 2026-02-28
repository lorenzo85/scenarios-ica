## Congratulations!

You have completed the **Circuit Breaking** scenario.

## What You Learned

- How to configure connection pool limits to cap concurrent requests and pending connections
- How to enable outlier detection to automatically eject unhealthy hosts from the load-balancing pool
- How Istio's circuit breaker is implemented in the Envoy sidecar — no application code changes needed
- How to use `fortio` to generate load and observe circuit breaker behavior through response codes
- How upstream request overflow triggers `503` responses and what the `overflow` stat tracks
- How circuit breaking prevents cascading failures when a downstream service becomes overloaded

## Key Istio Resources Used

- `DestinationRule` — configures `connectionPool` and `outlierDetection` under `trafficPolicy`
- `connectionPool.http` — limits `http1MaxPendingRequests` and `http2MaxRequests`
- `outlierDetection` — defines ejection thresholds based on consecutive errors and intervals

**Official Istio Docs:** [Circuit Breaking](https://istio.io/latest/docs/tasks/traffic-management/circuit-breaking/)
