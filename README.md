# kubernetes-troubleshooting
Hints and trick for troubleshooting Kubernetes in daily usage

I appreciate any kind of contributions to this repo 

```
Apply env vars banner.txt
find /app -type f -name 'banner.txt' -exec sh -c 'x="{}"; envsubst < "$x"' \;
```
Create random data
```
 head -c 3G </dev/urandom >myfile
```
