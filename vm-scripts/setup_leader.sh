#!/bin/bash
declare -a MACHINE_IPs=("10.0.2.5")

for i in "${MACHINE_IPs[@]}"
do
    
    echo "$i"
done


# # Setup docker swarm
# touch ../swarm_join_command.txt
# sudo docker swarm init > ../swarm_join_command.txt

# # Setup image redistry
# sudo ufw allow 5000
# sudo docker service create --name registry --publish published=5000,target=5000 registry:2


