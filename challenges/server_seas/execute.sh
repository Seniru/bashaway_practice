#!/bin/bash

for port in 11001 11002 11003; do
    if ! nc -zv localhost $port > /dev/null 2>&1; then
        exit 0
    fi
done

echo "
    upstream backend {
        server localhost:11001;
        server localhost:11002;
        server localhost:11003;
    }

    server {
        listen 11000;
        listen      [::]:11000;

        server_name localhost;

        location / {
            proxy_pass http://backend/;
        }
    }


" | sudo tee /etc/nginx/conf.d/loadbalancer.conf > /dev/null

sudo systemctl restart nginx
sleep 3
