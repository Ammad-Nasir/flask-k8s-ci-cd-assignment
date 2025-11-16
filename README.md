README
# Flask Kubernetes CI/CD Pipeline

Table of Contents
1. [Project Overview](#project-overview)
2. [Technologies Used](#technologies-used)
3. [Project Structure](#project-structure)
4. [Kubernetes Features](#kubernetes-features)
5. [Build and Run Locally](#build-and-run-locally)
6. [Deploying to Kubernetes via Jenkins](#deploying-to-kubernetes-via-jenkins)
7. [Scaling and Rollbacks](#scaling-and-rollbacks)
8. [CI/CD Pipeline](#cicd-pipeline)
9. [Author](#author)

---

Project Overview
This project demonstrates an **end-to-end CI/CD pipeline** for a Python Flask application deployed on Kubernetes. It simulates a real-world workflow using **GitHub, Docker, Jenkins, and Minikube**.  

The pipeline automatically builds, tests, deploys, and verifies the Flask application whenever changes are merged into the main branch.


Technologies Used
- Python 3.10
- Flask
- Docker
- Kubernetes (Minikube)
- Git & GitHub
- Jenkins
- GitHub Actions (CI)


Project Structure
```

flask-k8s-ci-cd-assignment/
├── app.py                 # Flask application code
├── requirements.txt       # Python dependencies
├── Dockerfile             # Multi-stage Docker build
├── Jenkinsfile            # Declarative Jenkins pipeline
├── kubernetes/
│   ├── deployment.yaml    # Deployment manifest
│   └── service.yaml       # Service manifest (NodePort)
└── README.md              # Project documentation

Kubernetes Features
- Deployment: Configured with multiple replicas for scalability.
- Rolling Updates: Allows zero-downtime updates of the application.
- Rollback: Undo deployment if a bad image is pushed.
- Service (NodePort): Provides external access to the application.
- Resource Limits: CPU and memory requests and limits configured for pods.

Build and Run Locally
1. Build the Docker image:
```cmd
docker build -t amd808/flask-k8s-app:latest .
````

2. Run the Docker container locally:

```cmd
docker run -p 5000:5000 amd808/flask-k8s-app:latest
```

3. Visit the application in your browser: [http://localhost:5000](http://localhost:5000)

---

## Deploying to Kubernetes via Jenkins

1. Merge changes to the `main` branch.
2. Jenkins pipeline automatically:

    Builds the Docker image (`amd808/flask-k8s-app:latest`)
    Applies Kubernetes manifests from `kubernetes/`
    Verifies rollout status and ensures all pods are running
3. Access the service externally via NodePort:

```cmd
kubectl get service flask-service
```

4. Open the application using the NodePort on Minikube IP.

---

## Scaling and Rollbacks

Scale replicas:

```cmd
kubectl scale deployment flask-app --replicas=3
kubectl get pods


Rollback deployment:

```cmd
kubectl set image deployment/flask-app flask-container=wrong-image:1
kubectl rollout status deployment/flask-app
kubectl rollout undo deployment/flask-app
kubectl get pods
```

---

## CI/CD Pipeline

GitHub Actions: Runs linting (flake8), pytest, and Docker build on every push.
Jenkins Pipeline: Deploys the Docker image to Kubernetes automatically and verifies deployment.
End-to-End Flow:

  1. Developer pushes changes → GitHub Actions tests code
  2. PR merged → Jenkins pipeline triggered
  3. Jenkins deploys to Minikube → Kubernetes pods updated

---

## Author

Admin: [Admin Name & Roll Number]
Developer: Ammad Nasir, [Your Roll Number]



This README covers everything required for Task 5: description, technologies, structure, Kubernetes features, Docker usage, Jenkins deployment, scaling/rollback instructions, and pipeline workflow.  

After creating this README.md:  

1. Stage and commit it:  
```cmd
git add README.md
git commit -m "Task 5: Add detailed README.md for final integration"
````

2. Push the branch:

```cmd
git push origin feature/final-touch
```

3. Create a PR to `main` for Admin to merge.

