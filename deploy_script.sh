#!/bin/bash

echo "Starting deployment..."

# ตรวจสอบการ deploy
if scp -r ./dist suvarot@192.168.1.100:/var/www/myapp; then
    echo "Deployment complete!"
else
    echo "Deployment failed!"
    exit 1
fi
