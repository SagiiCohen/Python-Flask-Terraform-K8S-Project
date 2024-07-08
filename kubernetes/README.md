# Barkuni Books Shop App Kuberenets files

This repository contains Kubernetes configuration files for deploying the Barkuni Books Shop application.

## Deployment

### File: `barkuni-books-shop-app-deploy.yaml`

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: barkuni-books-shop-app-deploy
  labels:
    name: barkuni-books-shop-app-deploy
    app: barkuni-books-shop
spec:
  replicas: 1
  selector:
    matchLabels:
      name: barkuni-books-shop-app
      app: barkuni-books-shop     
  template:
    metadata:
      name: barkuni-books-shop-app
      labels:
        name: barkuni-books-shop-app
        app: barkuni-books-shop
    spec:
      containers:
      - name: barkuni-books-shop-app
        image: sagicohen8/barkuni-books-shop-app:latest
        ports:
        - containerPort: 5000
```

### Description

This deployment file specifies a single replica of the Barkuni Books Shop application using a Docker image `sagicohen8/barkuni-books-shop-app:latest`. It exposes port 5000 internally.

## Service

### File: `barkuni-books-shop-app-service.yaml`

```yaml
apiVersion: v1
kind: Service
metadata:
  name: barkuni-books-shop-app-service
  labels:
    name: barkuni-books-shop-app-service
    app: barkuni-books-shop
spec:
  type: LoadBalancer
  selector:
    name: barkuni-books-shop-app
    app: barkuni-books-shop
  ports:
    - protocol: TCP
      port: 80    
      targetPort: 5000
```

### Description

This service file defines a LoadBalancer type service that exposes port 80 externally, targeting port 5000 of the Barkuni Books Shop application deployment.