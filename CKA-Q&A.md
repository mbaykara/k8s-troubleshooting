### 1. Create a static pod named static-busybox on the master node that uses the busybox image and the command sleep 1000.
```
#Create a pod definition file in the manifests directory. For that use command 
kubectl run --restart=Never --image=busybox static-busybox --dry-run=client -oyaml --command -- sleep 1000 > /etc/kubernetes/manifests/static-busybox.yaml
```
### 2. Create a service messaging-service to expose the messaging application within the cluster on port 6379.
```
kubectl expose pod messaging --port=6379 --name messaging-service
```
### 3.  Use JSON PATH query to retrieve the osImages of all the nodes and store it in a file /opt/outputs/nodes_os_x43kj56.txt.
The osImages are under the nodeInfo section under status of each node.
```
kubectl get nodes -o jsonpath='{.items[*].status.nodeInfo.osImage}' > /opt/outputs/nodes_os_x43kj56.txt
```
