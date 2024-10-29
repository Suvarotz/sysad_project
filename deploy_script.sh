#!/bin/bash

echo "Starting deployment..."

# สร้าง Docker image
docker build -t myapp .

# รัน Docker container
docker run -d -p 3000:3000 myapp

# รอให้แอพพลิเคชั่นเริ่มทำงาน
sleep 5  # หรือใช้ loop เพื่อตรวจสอบว่า port 3000 เปิดอยู่

# ตรวจสอบสถานะของแอพพลิเคชั่น
if curl -f http://localhost:3000; then
    echo "App is running successfully."
else
    echo "App failed to start."
    exit 1
fi

echo "Deployment complete!"
