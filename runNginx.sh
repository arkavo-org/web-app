#!/bin/bash

# Get the last two levels of the directory structure
PARENT_DIR=$(basename "$(dirname "$PWD")")
CURRENT_DIR=$(basename "$PWD")
export CONTAINER_NAME="${PARENT_DIR}-${CURRENT_DIR}"
echo "CONTAINER NAME $CONTAINER_NAME"

# run the HTTPS proxy
docker run -d \
  --name arkavo-dev-nginx \
  --restart always \
  --net=host \
  -p 5173:443 \
  -v "$(pwd)/nginx.conf:/etc/nginx/nginx.conf" \
  -v "./keys/privkey.pem:/keys/privkey.pem" \
  -v "./keys/fullchain.pem:/keys/fullchain.pem" \
  nginx

