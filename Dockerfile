FROM nginx:alpine

# Fix Mac permission issue: use /tmp for nginx cache
RUN mkdir -p /tmp/nginx/client_temp /tmp/nginx/proxy_temp /tmp/nginx/fastcgi_temp /tmp/nginx/uwsgi_temp /tmp/nginx/scgi_temp \
    && sed -i 's|/var/cache/nginx|/tmp/nginx|g' /etc/nginx/nginx.conf

# Remove default files and copy yours
RUN rm -rf /usr/share/nginx/html/*
COPY app/ /usr/share/nginx/html/

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
