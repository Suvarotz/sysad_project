#!/bin/bash

echo "Starting deployment..."

# สร้าง Docker image
docker build -t myapp .

# รัน Docker container
docker run -d -p 3000:3000 myapp

echo "Deployment complete!"
