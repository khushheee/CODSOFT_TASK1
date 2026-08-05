# Stage 1: Build - just copy static files
FROM nginx:alpine AS builder
WORKDIR /app
COPY app/ .

# Stage 2: Production with security hardening
FROM nginx:alpine
LABEL maintainer="Khushi Chauhan"
LABEL version="1.0"
LABEL description="CodSoft Task 1 - Secure Dockerized DevSecOps Dashboard"

# Install wget for healthcheck
RUN apk add --no-cache wget

# Security: Create non-root user
RUN addgroup -g 1001 -S appgroup && adduser -S appuser -u 1001 -G appgroup

# Copy files and set permissions
COPY --from=builder /app /usr/share/nginx/html
RUN chown -R appuser:appgroup /usr/share/nginx/html

# Expose port and healthcheck
EXPOSE 8080
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -qO- http://localhost:8080 || exit 1

USER appuser
CMD ["nginx", "-g", "daemon off;"]
