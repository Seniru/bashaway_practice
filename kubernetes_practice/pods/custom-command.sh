cat > hello.sh <<EOF
#! /bin/sh
echo hello world
EOF

chmod +x hello.sh

kubectl run custom --image=alpine:latest --restart=Never -- sleep 3600

while [ $(kubectl get pod custom -o custom-columns=:.status.phase) != "Running" ]; do
    sleep 0.5
done
kubectl cp ./hello.sh custom:/usr/bin/hello

rm hello.sh

kubectl exec custom -- hello