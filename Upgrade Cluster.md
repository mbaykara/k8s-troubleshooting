### Kubeadm way
1. We can upgrade one minor version at the time i.e from `v1.11.0` to `v1.12.0`
2. Kubeadm does not upgrade kubelet
3. Upgrade kubeadm it self `apt-get upgrade kubeadm=1.12.0-00`
4. Upgrade `kubelet` if is installed on master via `apt-get upgrade -y kubelet=1.12.0-00`
5. Restart kubelet `systemctl restart kubelet`

### Upgrade Workers(one by one)
1. `kubectl drain node-1` moves all pods on the node-1 to other available nodes
2. Repeat the same upgrade procedures 4. and 5. steps above.
3. Run kubeadm configs `kubeadm upgrade node config --kubelet-version v1.12.0` 
4. `systemctl restart kubelet`
5. Finally, make the node reschedulable via `kubectl uncordon node-1`

The steps above can be performed for each node that has to be upgraded.
