#!/bin/bash
pnpm i -g pm2
pm2 delete network-sorcery
pm2 start src/server.js --name network-sorcery -f

if ! sudo cat /etc/hosts | grep api.jokes.bashaway.sliitfoss.org &> /dev/null; then
    echo 127.0.0.1 api.jokes.bashaway.sliitfoss.org | sudo tee -a /etc/hosts
fi

# create ssl certificates
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -sha256 -days 3650 -nodes \
    -subj "/C=XX/ST=StateName/L=CityName/O=CompanyName/OU=CompanySectionName/CN=api.jokes.bashaway.sliitfoss.org"

sudo rm -r /etc/nginx/ssl
sudo mkdir -p /etc/nginx/ssl

sudo mv cert.pem /etc/nginx/ssl
sudo mv key.pem /etc/nginx/ssl

echo "
    server {
        listen 443 ssl;
        listen      [::]:443 ssl;
        ssl_certificate     /etc/nginx/ssl/cert.pem;
        ssl_certificate_key /etc/nginx/ssl/key.pem;

        server_name api.jokes.bashaway.sliitfoss.org;

        location / {
            proxy_pass http://localhost:3000/;
        }
    }


" | sudo tee /etc/nginx/conf.d/jokes.conf > /dev/null
sudo systemctl restart nginx
sleep 3
