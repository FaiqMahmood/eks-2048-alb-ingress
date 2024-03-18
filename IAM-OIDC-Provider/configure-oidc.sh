#!/bin/bash

# Set cluster name as environment variable
export cluster_name=faiq-2048-demo-cluster

# Retrieve the OIDC issuer URL for the cluster
oidc_id=$(aws eks describe-cluster --name $cluster_name --query "cluster.identity.oidc.issuer" --output text | cut -d '/' -f 5)

# Check if there is an IAM OIDC provider configured already
if ! aws iam list-open-id-connect-providers | grep -q $oidc_id; then
    echo "IAM OIDC provider not configured for cluster $cluster_name. Configuring..."
    # Associate IAM OIDC provider with the cluster
    eksctl utils associate-iam-oidc-provider --cluster $cluster_name --approve
else
    echo "IAM OIDC provider already configured for cluster $cluster_name."
fi
