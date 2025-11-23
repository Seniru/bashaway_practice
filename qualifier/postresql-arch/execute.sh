#!/bin/bash
docker run -d \
    -e POSTGRES_DB=vectordb \
    -e POSTGRES_USER=postgres \
    -e POSTGRES_PASSWORD=bashaway2025 \
    -p 5432:5432 \
    --name postgres-bashaway \
    postgres:18.1-alpine3.22 \
    