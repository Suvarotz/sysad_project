#!/bin/bash

echo "Starting deployment..."

# สร้าง Docker image
docker build -t myapp .

# รัน Docker container
docker run -d -p 3000:3000 myapp

# ตรวจสอบสถานะของแอพพลิเคชั่น
sleep 5  # รอให้ container เริ่มทำงาน
curl -f http://localhost:3000 || echo "App not running!"

echo "Deployment complete!"
