# Killercoda Istio ICA Scenarios

Interactive, hands-on Killercoda scenarios for the Istio Certified Associate (ICA) exam.

## Scenario directory layout

Each scenario follows this exact structure:

```
<scenario-name>/
├── index.json                   # Killercoda manifest
├── init/
│   ├── init.md                  # Intro/learning page shown before step 1
│   ├── background.sh            # Waits for Kubernetes nodes to be Ready, touches /ks/.k8sfinished
│   └── foreground.sh            # Downloads Istio, sets PATH, deploys app, ends with exec bash --init-file
├── step1/ … stepN/
│   ├── text.md                  # Step instructions
│   └── verify.sh                # Verification script (sources /tmp/check-utils.sh)
├── finish/
│   └── finish.md                # Completion summary — no "Next Steps" section
└── assets/
    ├── wait-background.sh       # Polls for .k8sfinished, shown to user during init
    ├── check-utils.sh           # Shared verify helpers
    └── *.yaml                   # Kubernetes/Istio manifests deployed to /tmp
```

## index.json

- Backend: always `"imageid": "kubernetes-kubeadm-2nodes"`
- Assets are deployed to `/ks` (scripts) or `/tmp` (YAML files), all with `"chmod": "+x"`
- Every scenario must include `wait-background.sh` and `check-utils.sh` in assets

## foreground.sh conventions

All `foreground.sh` files:
- Start by waiting for Kubernetes: `FILE=/ks/wait-background.sh; while ! test -f ${FILE}; do clear; sleep 0.1; done; bash ${FILE}`
- Install Istio 1.26.0 and add to PATH via `.bashrc`
- Copy `istioctl.bash` autocomplete and set `alias k='kubectl'`
- End with: `exec bash --init-file <(echo '. ~/.bashrc; echo "Scenario is ready"')`
- Most scenarios pre-install Istio and deploy the sample app so the user can start practising immediately
- Exception: `istio-installation-*` scenarios leave installation to the user (that is the exercise)

## text.md conventions

- Executable commands: `\`\`\`bash ... \`\`\`{{exec}}`
- Copyable-only content: `\`\`\`yaml ... \`\`\`{{copy}}`
- YAML editing pattern: `> <file>.yaml && vi <file>.yaml`{{exec}} followed by the YAML block with `{{copy}}`
- Tip/Solution blocks use `<details><summary>Tip</summary>` / `<details><summary>Solution</summary>`
- Service description tables use 2-column markdown: `| Name | Role |`
- Never add a `## Next Steps` section to `finish.md`

## Sample application

All scenarios (except `istio-installation-istioctl` and `playground`) use:

| Resource | Image | Port |
|----------|-------|------|
| `booking-service` | `kubeteam/booking-service:v1` | 8084 (Service: 80) |
| `notification-service` | `kubeteam/notification-service:v1` | 8084 (Service: 80) |
| `tester` | `nginx` | — used to exec curl commands |

Assets: `booking-deployment.yaml` + `notification-deployment.yaml` (deployed to `/tmp`).
`booking-service` calls `notification-service` on `POST /book`.

## Istio resource constraints (Killercoda)

All IstioOperator profiles set resource requests to zero so the Killercoda nodes can schedule all pods:

```yaml
components:
  pilot:
    k8s:
      resources:
        requests:
          cpu: 0m
          memory: 0Mi
values:
  pilot:
    autoscaleEnabled: false
  global:
    proxy:
      resources:
        requests:
          cpu: 0m
          memory: 0Mi
```

For ambient mode also set `values.ztunnel.resources.requests` and `values.cni.resources.requests` to `0m`/`0Mi`.

## Verification helpers (check-utils.sh)

```bash
check_resource_exists <resource-type> [namespace] <name>
check_path_value <resource-type> <name> [namespace] <jsonpath> <expected>
check_array_length <resource-type> <name> <jsonpath> <expected-length>
check_output_contains "<command>" "<string>"
check_output_does_not_contain "<command>" "<string>"
```

All verify.sh files start with `source /tmp/check-utils.sh`.

## Adding a new scenario

1. Create the directory following the layout above
2. Copy `assets/wait-background.sh` and `assets/check-utils.sh` from an existing scenario
3. Add the scenario path to `structure.json`
4. Add a row to the correct category table in `README.md`

## Repository-level files

- `structure.json` — ordered list of all scenario paths (used by Killercoda)
- `README.md` — scenario table grouped by category; uses static shields.io badge for license
- `.gitignore` — includes `.idea` and `.claude/settings.local.json`
- `istio-logo.svg` — used in all `init/init.md` headers
