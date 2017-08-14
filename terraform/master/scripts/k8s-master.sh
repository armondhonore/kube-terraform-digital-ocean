#!/bin/bash
TOKEN=9b60c2.a62d14dea50eebac

export MASTER_IP=$(curl -s http://169.254.169.254/metadata/v1/interfaces/public/0/ipv4/address)
kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address $MASTER_IP --token $TOKEN

chmod +r /etc/kubernetes/admin.conf

adduser --disabled-password --disabled-password --gecos "" k8smaster
usermod -aG sudo k8smaster

echo "=================="

mkdir -p /home/k8smaster/.kube
chown k8smaster:k8smaster /home/k8smaster/.kube

cp -i /etc/kubernetes/admin.conf /home/k8smaster/.kube/config
chown k8smaster:k8smaster /home/k8smaster/.kube/config
export KUBECONFIG=/home/k8smaster/.kube/config
echo "======2============"
sudo -i -u k8smaster kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
sudo -i -u k8smaster kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel-rbac.yml
sudo -i -u k8smaster kubectl create -f https://git.io/kube-dashboard-no-rbac
echo "=======3==========="
