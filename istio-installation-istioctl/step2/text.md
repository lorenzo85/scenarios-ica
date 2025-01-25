Move to the Istio package directory and add the Istio's `bin` folder to the environment path.

This is needed so that you can run the `istioctl` client in the terminal without specifying the full installation path.

Move to the current Istio directory:
```bash
cd istio-1.20.3/
```{{exec}}

Add the istioctl client to the path:
```bash
export PATH=$PWD/bin:$PATH
```{{exec}}
