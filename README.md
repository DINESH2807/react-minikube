# OEConnection Platform Engineer take home test

This project is used to complete the OEConnection platform engineer take home test.

This is a simple architecture with a front end project that needs to talk to a backend payments api. 

Make docker files for the two applications.

Build a helm chart for the front end and a separate chart for the payments api and install them on a local minikube server. 

Once the services are running, port forward into the root directory of the front end and capture a screenshot of the output in a browser. 

Once this is complete, return a zip file that contains the screenshot and any infrastructure files that were used to build and deploy the services. 



# Tooling 
Minikube https://minikube.sigs.k8s.io/docs/start/
Docker https://www.docker.com/
Helm https://helm.sh/ 

# Deploying React and C# application in Minikube

# Prerequiste
  #### 1. Install docker - https://docs.docker.com/get-docker/
  
  #### 2. Install Kubectl - CLI tool for interacting with Kubernetes Clusters

  #### 3. Install minikube - Install K3d from the binaries - https://minikube.sigs.k8s.io/docs/start/

  #### 4. Install Justfile - To automate the commands - https://github.com/casey/just

  #### 5. Install Helm - https://helm.sh/ 

## How to deploy the application

   #### 1. Setup Kubernetes cluster from your local machine using Minikube. You can run the command to install Minikube

   This installs the minikube cluster to run in your local

    You can then run them with `just RECIPE`:

    ```sh
    $ just minikube-setup
    ```
    
   #### 2. Build payments api docker image
     
    Build the Payments-API as a Docker image

    ```sh
    $ just build-payments-api
    ```
   
   #### 3. Deploy Payment-api in minikube
   
   The below command will deploy payments-api
   ```sh
   $ just deploy-backend
   ```
   
   #### 4. Exposed backend as nodeport and the url needs to be updated in the Frontend src/App.jsx
   
   The below command will port forward your payments-api service. Update this output URL in the Frontend React in src/App.jsx.
   ```sh
   $ minikube service payments-api --url 
   ```
   

   #### 5. Build the React Frontend
   
   Build the React Frontend as a Docker image

   ```sh
   $ just build-frontend
   ```

   #### 6. Deploy the React Frontend in the Minikube
   
   The below command will deploy react-frontend

   ```sh
   $ just deploy-frontend
   ```
   
   #### 7. Expose the react-frontend service in the local

   ```sh
   $ minikube service react-frontend --url
   ```