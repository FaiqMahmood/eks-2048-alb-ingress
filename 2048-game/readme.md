# Game 2048 Kubernetes Resources

This set of Kubernetes YAML manifests defines resources required to deploy and expose the Game 2048 application.

## Prerequisites

Ensure you have the following prerequisites before applying these manifests:

- **Kubernetes Cluster**: You need access to a Kubernetes cluster where you want to deploy the Game 2048 application.
- **kubectl**: Install the Kubernetes command-line tool (`kubectl`) to apply these YAML manifests to your Kubernetes cluster.

## Usage

1. **Create Fargate Profile**: Create a fargate profile using the following command:

   ```bash
   eksctl create fargateprofile \
       --cluster your-cluster-name \
       --region your-region \
       --name alb-sample-app \
       --namespace game-2048
   ```

2. **Apply YAML Manifests**: Apply the provided YAML file to your Kubernetes cluster using the following command:
   ```bash
   kubectl apply -f game-2048.yaml
   ```

## Description

The YAML file contains the following Kubernetes resources:

- **Namespace**: Creates a namespace named `game-2048` to isolate resources for the Game 2048 application.
- **Deployment**: Deploys the Game 2048 application with 5 replicas. It uses an image from the specified ECR repository.
- **Service**: Exposes the Game 2048 application within the `game-2048` namespace on port 80 using the NodePort type.
- **Ingress**: Defines an Ingress resource to route traffic to the Game 2048 service. It uses annotations suitable for AWS ALB Ingress Controller.

_Note_ - The service and ingress resources created will not have an external IP address associated with them yet.

## Applying the Manifests

After setting up your Kubernetes environment and ensuring you have the necessary permissions, use the provided `kubectl apply -f` command to apply the YAML file to your cluster. This will create the required resources for running the Game 2048 application.
