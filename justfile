# Justfile

#setup minikube and minikube docker environment
minikube-setup:
    minikube start
    eval $(minikube docker-env)

# Build go Docker images
build-frontend:
    docker buildx build -f "front-end/Dockerfile" -t react-frontend:v1 .

# Build java Docker images
build-payments-api:
    docker buildx build -f "payments-api/Dockerfile" -t csharp-backend:v1 .

# Deploy the paymen application
deploy-backend:
    helm install payments-api ./helm-charts/payments-api

#Deploy the frontend update the value for the payments api in the helm chart
deploy-frontend:
    helm install react-frontend ./helm-charts/react-frontend