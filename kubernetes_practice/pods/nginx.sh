#! /bin/bash

kubectl run nginx --image=nginx:mainline-alpine
# kubectl port-forward pod/nginx 8080:80
kubectl expose pod nginx --type=NodePort --port=80
sleep 3

minikube service nginx
