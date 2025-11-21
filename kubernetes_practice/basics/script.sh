#! /bin/bash

# start local cluster
minikube start

# verify health
kubectl get nodes
kubectl get pods -n kube-system

# view all namespaces
kubectl get namespaces
# or
# kubectl get ns

# get all cluster resources
kubectl get all --all-namespaces

# view cluster events
kubectl get events

# create new cluster
kubectl create ns learn

# and delete it
kubectl delete ns learn