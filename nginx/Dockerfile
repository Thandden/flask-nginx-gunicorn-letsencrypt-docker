# Use the official Nginx image as the base image
FROM nginx:latest

# Install necessary packages for Certbot
RUN apt-get update && \
    apt-get install -y certbot python3-certbot-nginx

# Copy the Nginx configuration template
COPY nginx.conf /etc/nginx/nginx.conf.template

# Copy the update-nginx.sh script
COPY update-nginx.sh /usr/local/bin/

# Make the script executable
RUN chmod +x /usr/local/bin/update-nginx.sh

# Expose ports for HTTP and HTTPS
EXPOSE 80 443

# Set the script as the entrypoint
ENTRYPOINT ["update-nginx.sh"]
