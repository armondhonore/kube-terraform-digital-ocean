kubectl create  -f db-pod.yml -f db-service.yml -f web-pod.yml -f web-service.yml
sleep 30
kubectl get all --all-namespaces
