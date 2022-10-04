# MyReact APP development Dockerfile
FROM node:lts-alpine

# Change current working directory
WORKDIR /app

# Define exposed port
# EXPOSE 3000

# Start app in development mode
CMD [ "npm", "start" ]
