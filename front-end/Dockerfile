# Use the official Node.js image as the base image
FROM node:18 AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY ./front-end/package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY ./front-end/ .

# Build the React application
RUN npm run build

# Use the official Nginx image as the base image for serving the React application
FROM nginx:stable-alpine

# Copy the build output to Nginx's HTML directory
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
