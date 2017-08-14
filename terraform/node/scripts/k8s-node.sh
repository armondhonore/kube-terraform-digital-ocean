#!/bin/bash

# Replace this with the token - use for testing and debug
#TOKEN=9b60c2.a62d14dea50eebac

#Uncomment to  use for testing and debug
#MASTER_IP=165.227.78.8

kubeadm join --token $TOKEN $MASTER_IP:6443
