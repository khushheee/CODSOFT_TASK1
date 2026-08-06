# CODSOFT TASK 1: Dockerized DevSecOps Dashboard

## Intern Details
**Name:** Khushi Chauhan  
**Company:** CODSOFT  
**Domain:** DevOps  

##  Project Description
This project is part of CODSOFT Internship Task 1. The goal was to containerize a static web application using Docker and demonstrate DevSecOps principles.

The "DevSecOps Dashboard" is a responsive web dashboard that shows real-time status of CI/CD Pipeline, Security Scans, Docker Health, and Team Activity. The entire application is served using Nginx inside a Docker container for fast, lightweight, and secure deployment.

##  Key Features
- **Containerized with Docker**: Single command deployment
- **Lightweight Image**: Used `nginx:alpine` for minimal size and attack surface
- **DevSecOps Focus**: Dashboard UI built to represent real DevOps monitoring
- **Port Mapping**: Accessible at `localhost:8080`
- **Production Ready**: Follows best practices for serving static sites

##  Tech Stack
`Docker` `Nginx` `HTML5` `CSS3` `DevSecOps`

##  How to Run Locally

### Prerequisites
Docker Desktop installed

### Steps
1.  **Clone the repository**
    ```bash
    git clone https://github.com/khushheee/CODSOFT_TASK1.git
    cd CODSOFT_TASK1

2.  **Build the Docker Image**

          docker build -t codsoft-task1:v1 .
    
4.  **Run the Container**
   
        docker run -d -p 8080:80 --name codsoft-app codsoft-task1:v1

5.  **Access the Application**

    Open: http://localhost:8080

