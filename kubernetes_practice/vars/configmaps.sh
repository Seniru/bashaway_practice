#! /bin/bash

kubectl create configmap literal-configs \
    --from-literal='key1=value1' \
    --from-literal='key2=value2'

kubectl describe configmaps literal-configs

kubectl create configmap file-configs \
    --from-file='key1=value.txt'

kubectl describe configmaps file-configs

kubectl create configmap env-configs \
    --from-env-file='.env'

kubectl describe configmap env-configs

# mount a configmap to a volume
kubectl run redis --image=redis:latest -o yaml > redis-pod.yaml

# then need to add the following to the result file
# - name: config-map
#   mountPath: /etc/config
# ...
# volumes:
#  - name: config-map
#    configMap:
#      name: env-configs

kubectl create -f redis.pod.yaml
kubectl exec redis -- ls /etc/config
kubectl exec redis -- cat /etc/config/SECRET1
