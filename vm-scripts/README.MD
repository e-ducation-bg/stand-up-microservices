The `install_node.sh` script should be run on all the machines that will be running as part of the cluster (docker swarm):

```
sudo ./install_node.sh
```

The `setup_leader.sh` script should be run on the machines that will act as leaders in the cluster (dcoker swarm):

```
sudo ./setup_leader.sh
```