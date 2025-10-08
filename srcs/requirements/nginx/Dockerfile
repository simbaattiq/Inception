# # Use Debian Bookworm as the base image
# FROM debian:bookworm-slim

# # Set environment variables for non-interactive operations
# ENV DEBIAN_FRONTEND=noninteractive

# # Update package lists and install NGINX and required dependencies
# RUN apt-get update && \
#     apt-get install -y --no-install-recommends \
#         nginx \
#         openssl \
#         ca-certificates && \
#     rm -rf /var/lib/apt/lists/*

# # Create a non-root user and group for security
# RUN groupadd --system --gid 101 nginx && \
#     useradd --system --gid nginx --no-create-home --shell /bin/false --uid 101 nginx

# # Change ownership of NGINX directories to the non-root user
# RUN chown -R nginx:nginx /var/cache/nginx && \
#     chown -R nginx:nginx /var/log/nginx

# # Copy your custom NGINX configuration and SSL certificates
# COPY ./conf/nginx.conf /etc/nginx/nginx.conf
# COPY ./ssl/server.crt /etc/nginx/ssl/
# COPY ./ssl/server.key /etc/nginx/ssl/

# # Create necessary directories and ensure correct permissions
# RUN mkdir -p /usr/share/nginx/html && \
#     chown -R nginx:nginx /usr/share/nginx/html && \
#     chmod -R 755 /usr/share/nginx/html

# # Expose ports for HTTP and HTTPS traffic
# EXPOSE 80 443

# # Switch to the non-root user for added security
# USER nginx

# # Define the command to start NGINX as PID 1
# # This ensures it runs in the foreground, essential for Docker containers
# CMD ["nginx", "-g", "daemon off;"]



FROM debian:bullseye
    
RUN apt-get update && apt-get install -y \
    nginx \
    openssl \
    && rm -rf /var/lib/apt/lists/*

# Generate SSL certificate
RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=FR/ST=France/L=Paris/O=42School/CN=localhost"

# Copy NGINX configuration
COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]