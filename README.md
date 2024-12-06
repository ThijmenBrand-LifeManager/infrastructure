# Introduction

# Azure AKS Deployment
## Stap 1: Deploy infrastructure
Deploy the infrastructure using terraform, head into terraform directory and run the following commands:
```bash
$ terraform plan
$ terraform apply
```

## Step 2: Connect to the AKS cluster
Connect to the AKS cluster locally using the following command:
```bash
$ az aks get-credentials --resource-group lfm-nonprod --name lfm-dev-k8s --overwrite-existing
```

## Step 3: Install the nginx ingress on AKS
install nginx ingress helm repository on AKS using the following commands:
```bash
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

helm install ingress-nginx ingress-nginx/ingress-nginx \
  --set controller.service.annotations."service\.beta\.kubernetes\.io/azure-load-balancer-health-probe-request-path"=/healthz \
  --set controller.service.externalTrafficPolicy=Local
```

## Step 4: Install the helm deployment
```bash
$ helm install lifemanager .
```
