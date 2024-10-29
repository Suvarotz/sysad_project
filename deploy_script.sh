#!/bin/bash

echo "Starting deployment..."

scp -r ./dist user@your-server-ip:/path/to/deployment-directory

echo "Deployment complete!"
