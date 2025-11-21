#! /bin/bash

kubectl create secret generic literal-secret \
    --from-literal='key1=value1' \
    --from-literal='key2=value2'

kubectl describe secret literal-secret

kubectl create secret generic file-secret \
    --from-file='key1=value.txt'

kubectl describe secret file-secret

kubectl create secret generic env-secret \
    --from-env-file='.env'

kubectl describe secret env-secret

# can access the secret like this
secret=$(kubectl get secret literal-secret -o jsonpath='{.data.key1}' | base64 --decode)

# create a pod with the secret
kubectl run redis --image=redis:latest --env="SECRET=$secret"
