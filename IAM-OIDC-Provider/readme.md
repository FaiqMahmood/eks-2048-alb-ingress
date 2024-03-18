# EKS Cluster OIDC Provider Configuration Script

This script automates the configuration of an IAM OIDC provider for an Amazon EKS (Elastic Kubernetes Service) cluster. It checks if an IAM OIDC provider is already configured for the specified EKS cluster and associates one if not.

## Prerequisites

Before running this script, ensure the following prerequisites are met:

- **AWS CLI**: Install the AWS Command Line Interface tool to interact with AWS services, including Amazon EKS.
- **kubectl**: Install the Kubernetes command-line tool to interact with Kubernetes clusters.
- **eksctl**: Install eksctl, a command-line tool for working with EKS clusters, which automates many individual tasks.

## Usage

1. **Set Cluster Name**: Set the name of your EKS cluster as an environment variable.

   ```bash
   export cluster_name=your-cluster-name
   ```

2. **Execute the Script**: Run the script to configure the IAM OIDC provider.
   ```bash
   ./configure_oidc.sh
   ```

## What Does the Script Do?

1. **Retrieve OIDC Issuer URL**: The script fetches the OIDC issuer URL for the specified EKS cluster using the AWS CLI.

2. **Check for Existing IAM OIDC Provider**: It checks if there's already an IAM OIDC provider associated with the cluster.

3. **Associate IAM OIDC Provider**: If no IAM OIDC provider is configured, the script associates one using eksctl.

## Note

Ensure you have appropriate permissions to execute the AWS CLI and eksctl commands, and replace `your-cluster-name` with the actual name of your EKS cluster.

For more information on setting up EKS clusters and configuring OIDC providers, refer to the [AWS documentation](https://docs.aws.amazon.com/eks/latest/userguide/getting-started-console.html).
