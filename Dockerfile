FROM node:14

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./
RUN npm install

# Bundle app source
COPY . .  

# Expose port
EXPOSE 22

# Start the application
CMD [ "npm", "start" ]
