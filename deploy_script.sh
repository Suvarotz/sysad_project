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

# รอให้แอพพลิเคชั่นเริ่มทำงาน
sleep 5

# ตรวจสอบสถานะของ container
if [ "$(docker ps -q -f id=$container_id)" ]; then
    echo "Container is running."
else
    echo "Container is not running."
    exit 1
fi

# ตรวจสอบสถานะของแอพพลิเคชั่น
if curl -f http://127.0.0.1:3000; then
    echo "App is running successfully."
else
    echo "App failed to start."
    exit 1
fi

echo "Deployment complete!"
