# Start Install Google Chrome (You may comment out these lines during local testing if you already have Chrome installed)

# sudo apt update
# 
# wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# sudo dpkg -i google-chrome-stable_current_amd64.deb
# 
# sudo apt-get install -f
# 
# rm google-chrome-stable_current_amd64.deb

# End Install Google Chrome

# Write your code here

# install dependencies & run servers
cd src

cd cornerstone
pnpm i
npx vite dev --port 3010 &
cd ..

cd dashboard
pnpm i
npx vite dev --port 3020 &
cd ..

cd support
pnpm i
npx next dev --port 3030 &
cd ..

cat > nginx.conf <<'EOF'
events {
    worker_connections 1024;
}

http {
    server {
        listen 80;
        server_name localhost;

        location / {
            proxy_pass http://localhost:3010/;
        }

        location /dashboard/ {
            proxy_pass http://localhost:3020/;
        }

        location /support/ {
            proxy_pass http://localhost:3030/;
        }
    }
}
EOF

docker run -d \
    --network host \
    -v "./nginx.conf:/etc/nginx/nginx.conf:ro" \
    nginx:mainline-alpine

# cleanup
# for port in 3010 3020 3030; do
#     sudo lsof -ti :"$port" | xargs -r sudo kill -9
# done