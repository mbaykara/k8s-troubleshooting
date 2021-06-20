#### 1. Backup the Cluster via etcdctl
```
ETCDCTL_API=3 etcdctl --cacert="path/to/ca.crt" --cert="path/to/server.crt" --key="path/to/server.key" snapshot save  /opt/your-cluster-backup.db
```
if the etc run on different node than control node then specify remote address.

##### Restore cluster via backup file
```
ETCDCTL_API=3 etcdctl snaphot restore /opt/snapshot-pre/boot.db --data-dir=/path/new/database
```
