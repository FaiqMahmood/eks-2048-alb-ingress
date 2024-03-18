#!/bin/bash

# Download IAM policy
curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.5.4/docs/install/iam_policy.json

# Create IAM Policy
policy_arn=$(aws iam create-policy \
    --policy-name AWSLoadBalancerControllerIAMPolicy \
    --policy-document file://iam_policy.json \
    --query 'Policy.Arn' \
    --output text)

# Get AWS account ID
aws_account_id=$(aws sts get-caller-identity --query 'Account' --output text)

# Create IAM Role
eksctl create iamserviceaccount \
  --cluster=<your-cluster-name> \
  --namespace=kube-system \
  --name=aws-load-balancer-controller \
  --role-name AmazonEKSLoadBalancerControllerRole \
  --attach-policy-arn=$policy_arn \
  --approve

# Install Helm
# Ensure Helm is installed and initialized (not included in the script)

# Add Helm Repo
helm repo add eks https://aws.github.io/eks-charts

# Update Helm Repo
helm repo update

# Install ALB Controller
helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system \
  --set clusterName=<your-cluster-name> \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller \
  --set region=<your-region> \
  --set vpcId=<your-vpc-id>

# Verify Deployments
kubectl get deployment -n kube-system aws-load-balancer-controller
