#!/bin/bash

echo "Starting deployment..."

# สร้าง Docker image
docker build -t myapp .

# รัน Docker container
container_id=$(docker run -d -p 3000:3000 myapp)

# รอให้แอพพลิเคชั่นเริ่มทำงาน
sleep 10


# ตรวจสอบสถานะของ container
if [ "$(docker ps -q -f id=$container_id)" ]; then
    echo "Container is running."
else
    echo "Container is not running."
    exit 1
fi

echo "Deployment complete!"
