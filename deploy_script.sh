#!/bin/bash

echo "Starting deployment..."

# ตรวจสอบการ deploy
if scp -r ./dist suvarot@127.0.0.1:/var/www/myapp; then
    echo "Deployment complete!"
else
    echo "Deployment failed!"
    exit 1
fi 
