### Certificate Authority
1. Create CA certificate keys 
```
$ openssl genrsa -out ca.key 2048
$ ca.key
```
2. Create Cerficate Signing Request
```
$ openssl req -new -key ca.key -sub "/CN=KUBERNETES-C"
$ ca.csr
```
3. Sign the certificate
```
openssl x509 -req -in ca.csr -signkey ca.key -out ca.crt
ca.crt
```
### Client Certificates
#### Admin User
1. `openssl genrsa -out admin.key 2048`
2. `openssl req -new -key admin.key -sub "CN-kube-admin/O=system:masters" -out admin.csr` we add group details 
that allows to differentiate admin from other users. 
3. `openssl x509 -req -in admin.csr -CA ca.crt -CAkey ca.key -out admin.crt`

#### Kubescheduler it should be same but with prefix System:
#### ETCD SERVER
#### Kube Api Server
1. `openssl genrsa -out apiserver.key 2048`

kube apiserver has many names or aliases:
```
kubernetes
kubernetes.default
kubernetes.default.svc
kubernetes.default.svc.cluster.lokal
```
All these names/dns have signed in certificate as well. So for that you need set openssl config file:
`openssl.cnf`
```
[req]
req_extension = v3_req
[v3_req]
basicContstraints = CA:FALSE
keyUsage = nonRepudiation
subjecetAltName = @alt_names
[alt_names]
DNS.1 = kubernetes
DNS.2 = kubernetes.default
.
.
IP = 172.23.0.32
```
2. Pass the openssl.cnf file to certificate signing request
 ```
 openssl req -new -key apiserver.key -subj "/CN=kube-apiserver" -out apiserver.csr -config openssl.cnf
 apiserver.csr  
 ```
 3. Sign the certificate via CA 
```
openssl x509 -req -in apiserver.csr -CA ca.crt -CAkey ca.key -out apiserver.crt
```

### Health Chech for Certificates
If the cluster setup was by `kubeadm` then check the pod command args to find certificates paths
Since you know where the certificates are located, you can make healtcheck via
```
openssl x509 -in /etc/kubernetes/pki/apiserver.crt -text -noout
```
Check points
[X] Name under Subject section
[X] Alternative Name
[X] Expire date/validation
[X] Issuer -> Who is the issuer
