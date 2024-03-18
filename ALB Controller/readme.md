# Setting Up AWS ALB (Application Load Balancer) Controller on Amazon EKS

This guide walks you through the process of setting up the AWS ALB Controller on Amazon EKS (Elastic Kubernetes Service) to manage Application Load Balancers.

## Prerequisites

Before starting the setup process, ensure you have the following prerequisites:

- **Kubernetes Cluster**: You need access to an Amazon EKS cluster where you want to deploy the ALB Controller.
- **AWS CLI**: Install the AWS Command Line Interface tool to interact with AWS services.
- **eksctl**: Install `eksctl`, a command-line tool for working with EKS clusters.
- **Helm**: Install Helm, a package manager for Kubernetes.

## Setup Steps

### 1. Download IAM Policy

Download the IAM policy required for the ALB Controller:

```bash
curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.5.4/docs/install/iam_policy.json
```

### 2. Create IAM Policy

Create an IAM policy using the downloaded JSON file:

```bash
aws iam create-policy \
    --policy-name AWSLoadBalancerControllerIAMPolicy \
    --policy-document file://iam_policy.json
```

### 3. Create IAM Role

Create an IAM role for the ALB Controller:

```bash
eksctl create iamserviceaccount \
  --cluster=<your-cluster-name> \
  --namespace=kube-system \
  --name=aws-load-balancer-controller \
  --role-name AmazonEKSLoadBalancerControllerRole \
  --attach-policy-arn=arn:aws:iam::<your-aws-account-id>:policy/AWSLoadBalancerControllerIAMPolicy \
  --approve
```

### 4. Deploy ALB Controller

#### Install Helm

Ensure Helm is installed. If not, follow the Helm installation instructions.

#### Add Helm Repo

Add the Helm repository for EKS charts:

```bash
helm repo add eks https://aws.github.io/eks-charts
```

#### Update the Repo

Update the Helm repository:

```bash
helm repo update
```

#### Install ALB Controller

Install the ALB Controller using Helm:

```bash
helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system \
  --set clusterName=<your-cluster-name> \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller \
  --set region=your-region \
  --set vpcId=your-vpc-id
```

### 5. Verify Deployments

Verify that the ALB Controller deployments are running:

```bash
kubectl get deployment -n kube-system aws-load-balancer-controller
```

## Next Steps

With the AWS ALB Controller deployed on your EKS cluster, you can now configure and manage Application Load Balancers to route traffic to your Kubernetes services.
