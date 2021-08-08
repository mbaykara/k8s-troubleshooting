## How to add new admin for cluster?

1. Create CertificateSigningRequest Object </br>
1.1. The user created his/her certs via `openssl genrsa -out alice.key 2048`</br>
1.2. Send the request to admin via `openssl req -new -key alice.key -subj "/CN=alice" -out alice`</br>
2. Review Requests
Administrator takes the key and create a `CertificateSigninRequest` object
```
apiVersion: certificates.k8s.io/v1beta1
kind: CertificateSigningRequest
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
   alice.csr | base64 to here
```
3. Review the request
`kubectl get csr`
4. Aprove Requests
`kubectl certificate approve alice`
5. Share Certs to Users
`kubectl get csr alice -o yaml ` decode and share with the user

control manager is responsible for certificate signing/approving

## How to add a new user to k8s cluster?

```
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: developer
rules:
- apiGroups: [""]
  resources: ["pods"]
  verbs: ["list", "get", "create", "delete", "update"] 
- apiGroups: [""]
  resources: ["ConfigMap"]
  verbs: [ "create"]
```  
  ---
  ####  lets bind the user to role
```
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: devuser-developer-binding
subjects:
- kind: User
  name: dev-user
roleRef:
  kind: Role
  name: developer
  apiGroup: rbac.authorization.k8s.io
  ```
