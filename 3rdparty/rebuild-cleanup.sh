#! /bin/bash

echo "It will rebuild compose images and clean-up docker system..."
echo "docker-compose build"
docker-compose build
echo "docker system prune"
docker system prune