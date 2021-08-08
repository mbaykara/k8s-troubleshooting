### 1. Upgrade Control Panel/Master
```
#upgrade kubadm version
$ apt-mark unhold kubeadm && apt-get update && apt-get install -y kubeadm=1.22.x-00 && apt-mark hold kubeadm

#check plan
$ sudo kubeadm upgrade apply v1.19.6
```
### 2. Upgrade Workers
