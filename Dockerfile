# Stage 1: Build
FROM nginx:alpine AS builder
WORKDIR /app
COPY app/ .

# Stage 2: Production with Security
FROM nginx:alpine
LABEL maintainer="Khushi Chauhan"
LABEL version="1.0"
LABEL description="CodSoft Task 1 - Secure DevSecOps Dashboard"

# 1. Create non-root user AND give permissions to nginx folders
RUN addgroup -g 1001 -S appgroup && \
    adduser -S appuser -u 1001 -G appgroup && \
    mkdir -p /var/cache/nginx /var/run/nginx /usr/share/nginx/html && \
    chown -R appuser:appgroup /var/cache/nginx /var/run/nginx /usr/share/nginx/html /etc/nginx/conf.d

# 2. Change nginx to run on 8080 instead of 80
RUN sed -i 's/listen 80;/listen 8080;/g' /etc/nginx/conf.d/default.conf

COPY --from=builder /app /usr/share/nginx/html
RUN chown -R appuser:appgroup /usr/share/nginx/html

EXPOSE 8080
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -qO- http://localhost:8080 || exit 1

USER appuser
CMD ["nginx", "-g", "daemon off;"]
