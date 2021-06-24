## How to add new admin for cluster?

1. Create CertificateSigningRequest Object </br>
1.1. The user created his/her certs via `openssl genrsa -out alice.key 2048`</br>
1.2. Send the request to admin via `openssl req -new -key alice.key -subj "/CN=alice" -out alice`</br>
2. Review Requests
Administrator takes the key and create a `CertificateSigninRequest` object
```
apiVersion: certificates.k8s.io/v1beta1
kind: CertificatesSigningRequest
metadata:
  name: alice
spec:
  groups:
    - system:authenticated
  useages:
  - digital signature
  - key encipherment
  - server auth
  reques
   //base64 encoded csr
```

4. Aprove Requests
5. Share Certs to Users

