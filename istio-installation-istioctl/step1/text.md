Download Istio release version `1.20.3` for `x86_64` using curl in the current directory with the command below.

You can pass inline environment variables such as `ISTIO_VERSION` and `TARGET_ARCH`
to download a specific version and for a specific architecture:

```bash
curl -L https://istio.io/downloadIstio \
            | ISTIO_VERSION=1.20.3 \
              TARGET_ARCH=x86_64 sh -
```{{exec}}
