#!/bin/bash

#docker container stop postgres-bashaway
#docker container rm postgres-bashaway

yes | sudo apt install libpq-dev
yes | sudo apt install postgresql-16-pgvector


docker run -d \
    -e POSTGRES_DB=vectordb \
    -e POSTGRES_USER=postgres \
    -e POSTGRES_PASSWORD=bashaway2025 \
    -p 5432:5432 \
    --name postgres-bashaway \
    pgvector/pgvector:pg17
    
until docker exec postgres-bashaway pg_isready -U postgres >/dev/null 2>&1; do
    echo "Waiting for Postgres to start..."
    sleep 1
done
docker exec postgres-bashaway psql 
docker exec postgres-bashaway psql -U postgres -d vectordb -c "CREATE EXTENSION IF NOT EXISTS vector;"



if [[ ! -d /etc/first ]]; then
    sudo mkdir -p /etc/first
else
    gcc -o insert src/inserter.c -I/usr/include/postgresql -L/usr/lib -lpq
    ./insert
    rm insert
fi