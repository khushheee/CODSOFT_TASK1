# Stage 1: Build
FROM nginx:alpine AS builder
WORKDIR /app
COPY app/.

# Stage 2: Production
FROM nginx:alpine
LABEL maintainer="Khushi Chauhan"
LABEL version="1.0"
LABEL description="CodSoft Task 1 - Secure Dockerized DevSecOps Dashboard"

# Install wget for healthcheck
RUN apk add --no-cache wget

# Copy files
COPY --from=builder /app /usr/share/nginx/html

# Fix permissions: Give nginx user access to cache + html
RUN chown -R nginx:nginx /usr/share/nginx/html /var/cache/nginx /var/run /var/log/nginx && \
    chmod -R 755 /var/cache/nginx /var/run /var/log/nginx

# Switch to nginx user instead of creating new one
USER nginx

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -qO- http://localhost:80 || exit 1

CMD ["nginx", "-g", "daemon off;"]
