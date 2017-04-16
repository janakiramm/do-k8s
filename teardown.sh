# Delete SSH Key
SSH_ID=`doctl compute ssh-key list | grep "k8s-ssh" | cut -d' ' -f1`
SSH_KEY=`doctl compute ssh-key get $SSH_ID --format FingerPrint --no-header`
doctl compute ssh-key delete $SSH_KEY

# Delete Tags
doctl compute tag delete k8s-master -f
doctl compute tag delete k8s-node -f

# Delete Droplets
doctl compute droplet delete master node1 node2 -f

# Delete Load Balancer
LB_ID=`doctl compute load-balancer list | grep "k8slb" | cut -d' ' -f1`
doctl compute load-balancer delete $LB_ID -f

