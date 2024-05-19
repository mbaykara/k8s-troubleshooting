1. List the pods
`curl https://clusterIP:6643/api/v1/pods --key admin.key --cert admin.crt --cacert ca.crt`
2. Check the api version `curl https://master-node:6443/version`


#### 1. Following error -> ` auth error: bcrypt_pbkdf: empty password`
Possible Solution: `your ssh key is password protected. Please provide the password or remove it.`
