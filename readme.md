# Description

In this project, we deploy the popular 2048 game application on an Amazon EKS (Elastic Kubernetes Service) cluster using Fargate for serverless compute. The goal is to make the application publicly accessible via an Application Load Balancer (ALB) by setting up deployment, service, and ingress resources. Additionally, we configure an IAM OIDC (OpenID Connect) provider to enable authentication and authorization for Kubernetes resource.

## Prerequisites

Before you begin, ensure you have the following prerequisites installed and configured:

- **AWS CLI**: The AWS Command Line Interface is necessary for interacting with AWS services, including Amazon EKS. If you haven't already installed it, please refer to the [Installing, updating, and uninstalling the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html) guide. Once installed, configure the AWS CLI with your credentials.

- **kubectl**: This command-line tool allows you to communicate with Kubernetes clusters. If you don't have `kubectl` installed, follow the instructions in the [Installing or updating kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) guide.

- **eksctl**: `eksctl` simplifies working with Amazon EKS clusters by automating various tasks. You can install or update it by following the instructions [here](https://github.com/weaveworks/eksctl#installation).

- **helm**: Helm is a package manager for Kubernetes that simplifies deploying applications and managing Helm charts. Install Helm by following the instructions [here](https://helm.sh/docs/intro/install/).

## Follow Along

**Tip**: Use your AWS root account for deploying the app to avoid permission issues.

### Creating an EKS Cluster

To create an Amazon EKS cluster, execute the following command:

```bash
eksctl create cluster --name your-cluster-name --region your-region --fargate
```

Replace `your-cluster-name` with the desired name for your EKS cluster and `your-region` with the AWS region where you want to create the cluster.

### Downloading _kubeconfig_ File

To download the kubeconfig file for your EKS cluster and configure `kubectl` to use it, run the following command:

```bash
aws eks update-kubeconfig --name your-cluster-name --region your-region
```

Replace `your-cluster-name` with the name of your EKS cluster and `your-region` with the AWS region where your cluster is located.

### Deploying the App

Navigate to the `2048-game` directory and follow the instructions in the `README.md` file to deploy the application.

### Configuring IAM OIDC Provider

Navigate to the `IAM-OIDC-Provider` directory and follow the instructions in the `README.md` file to configure the IAM OIDC provider for your EKS cluster.

### Setting up the ALB Controller

Navigate to the `ALB Controller` directory and follow the instructions in the `README.md` file to set up the AWS ALB Controller for managing Application Load Balancers on your EKS cluster.
