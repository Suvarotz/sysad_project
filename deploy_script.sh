#!/bin/bash

echo "Starting deployment..."

# ล็อกอินเข้า Docker Hub
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

# สร้าง Docker image
docker build -t myapp .

# Tag Docker image สำหรับ push
docker tag myapp "$DOCKER_USERNAME/myapp:latest"

# Push Docker image ไปยัง Docker Hub
docker push "$DOCKER_USERNAME/myapp:latest"

# รัน Docker container
container_id=$(docker run -d -p 3000:3000 myapp)


echo "Deployment complete!"
