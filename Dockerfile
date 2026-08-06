# Stage 1: Build
FROM nginx:alpine AS builder
WORKDIR /app
COPY app/ .

# Stage 2: Production
FROM nginx:alpine

LABEL maintainer="Khushi Chauhan"
LABEL version="1.0"
LABEL description="CODSOFT_TASK1 - Secure Dockerized DevSecOps Dashboard"

# Copy files from builder
COPY --from=builder /app /usr/share/nginx/html

# Give nginx user permission to write
RUN chown -R nginx:nginx /usr/share/nginx/html \
    && chmod -R 755 /usr/share/nginx/html

# Don't switch user. Let nginx start as root, then it drops to nginx user itself
EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -qO- http://localhost:80 || exit 1

CMD ["nginx", "-g", "daemon off;"]
