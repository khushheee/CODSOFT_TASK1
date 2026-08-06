FROM nginx:alpine

COPY app /usr/share/nginx/html

EXPOSE 80

HEALTHCHECK --interval=10s --timeout=3s CMD wget -q --spider http://localhost/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
