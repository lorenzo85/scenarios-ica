## Congratulations!

You have completed the **Traffic Shifting** scenario.

## What You Learned

- How to perform a weighted traffic split between two service versions using a `VirtualService`
- How to implement a canary release by incrementally shifting traffic from v1 to v2
- How Istio weighted routing differs from Kubernetes-native replica-count-based splitting
- How to progress from a 50/50 split to a full 100% cutover without redeploying pods
- How `DestinationRule` subsets map to pod label selectors for fine-grained version targeting
- How traffic shifting enables safe rollouts with the ability to roll back instantly by adjusting weights

## Key Istio Resources Used

- `VirtualService` — defines weighted route destinations using the `weight` field
- `DestinationRule` — declares `v1` and `v2` subsets using pod label selectors

**Official Istio Docs:** [Traffic Shifting](https://istio.io/latest/docs/tasks/traffic-management/traffic-shifting/)
