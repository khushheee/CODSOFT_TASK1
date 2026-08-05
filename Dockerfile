# Stage 1: Build
FROM nginx:alpine AS builder
WORKDIR /app
COPY app/ .

# Stage 2: Production - Official Non-Root Nginx
FROM nginxinc/nginx-unprivileged:1.27-alpine
LABEL maintainer="Khushi Chauhan"
LABEL version="1.0"
LABEL description="CodSoft Task 1 - Secure DevSecOps Dashboard"

# Copy files. This image already runs as user 101 on port 8080
COPY --from=builder /app /usr/share/nginx/html

EXPOSE 8080
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -qO- http://localhost:8080 || exit 1

CMD ["nginx", "-g", "daemon off;"]
