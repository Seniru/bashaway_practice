#! /bin/bash

# create deployment with 3 replicas
kubectl create deployment dep --image=alpine:latest --replicas=3
kubectl get deployments.apps

# scale deployment to 5 replicas
kubectl scale deployment dep --replicas=5
kubectl get deployments.apps

# perform rolling update
kubectl set image deployments/dep alpine=alpine:edge
kubectl rollout status deployment/dep

# rollback
kubectl rollout undo deployment/dep
kubectl get deployments.apps
