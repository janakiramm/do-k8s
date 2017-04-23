#!/bin/bash
TOKEN=325a02.a6c724d6a9ee5ce9
MASTER_IP=139.59.20.105

apt-get update && apt-get upgrade -y

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

cat <<EOF > /etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF

apt-get update -y

apt-get install -y docker.io
apt-get install -y --allow-unauthenticated kubelet kubeadm kubectl kubernetes-cni

kubeadm join --token $TOKEN $MASTER_IP:6443
