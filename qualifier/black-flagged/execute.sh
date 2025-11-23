#!/bin/bash

mkdir -p out

docker pull nginx:alpine

docker container stop nginx-orchestrator-test
docker container rm nginx-orchestrator-test

docker container stop backend-1-orchestrator
docker container stop backend-2-orchestrator
docker container stop backend-3-orchestrator
docker container rm backend-1-orchestrator
docker container rm backend-2-orchestrator
docker container rm backend-3-orchestrator

cat > out/nginx.conf <<'EOF'
http {
    upstream backend {
        server localhost:8081 max_fails=3 fail_timeout=10s;
        server localhost:8082 max_fails=3 fail_timeout=10s;
        server localhost:8083 max_fails=3 fail_timeout=10s;
    }

    server {
        listen 80;
        server_name localhost;

        root /www/html;


        location / {
            proxy_pass http://backend/;
        }

    }
}

events {
    worker_connections 1024;
}

EOF