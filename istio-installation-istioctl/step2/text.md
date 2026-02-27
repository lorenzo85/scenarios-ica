Move to the Istio package directory and add the Istio `bin` folder to the environment `PATH`.

This is needed so that you can run the `istioctl` client in the terminal without specifying the full installation path each time.

Move to the Istio directory:
```bash
cd istio-1.20.3/
```{{exec}}

Add the `istioctl` binary to the `PATH`:
```bash
export PATH=$PWD/bin:$PATH
```{{exec}}

Verify `istioctl` is available and check its version:
```bash
istioctl version --remote=false
```{{exec}}

You should see output similar to:
```text
client version: 1.20.3
```

> **Note:** The `PATH` change is session-scoped. In a persistent environment, add the export to your shell profile (e.g. `~/.bashrc` or `~/.zshrc`).

Explore available `istioctl` commands and flags:
```bash
istioctl --help
```{{exec}}
