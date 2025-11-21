#! /bin/bash

kubectl create deployment redis --image=redis:latest

# expose the service to a an internal IP address (only works for cluster communications)
kubectl expose deployment redis --type=ClusterIP --port=6379
kubectl get svc
kubectl delete svc redis

# expose the service to the host machine
# the service is accessible through cluster-ip:port
kubectl expose deployment redis --type=NodePort --port=6379
kubectl get svc
kubectl delete svc redis

# LoadBalancer has external ips
kubectl expose deployment redis --type=LoadBalancer --port=6379
kubectl get svc
kubectl delete svc redis