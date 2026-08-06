FROM nginx:alpine

LABEL maintainer="Khushi Chauhan"
LABEL version="1.0" 
LABEL description="CODSOFT_TASK1 - DevSecOps Dashboard"

# Copy website files
COPY app/ /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
