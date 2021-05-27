1. The namespace “stuck” as Terminating status, how to resolve it?

```
 kubectl get namespace <YOUR_NAMESPACE> -o json   | tr -d "\n" | sed "s/\"finalizers\": \[[^]]\+\]/\"finalizers\": []/"   | kubectl replace --raw /api/v1/namespaces/<YOUR_NAMESPACE>/finalize -f -
```
