module "resource-group" {
  source   = "../modules/resource-group"
  name     = "${var.resource_group_name}-dev"
  location = var.location
  tags     = var.tags
}

module "postgres-database" {
  source                 = "../modules/postgresql"
  postgres_server_name   = var.postgres_server_name
  resource_group_name    = module.resource-group.name
  location               = module.resource-group.location
  tags                   = var.tags
  postgres_version       = var.postgres_version
  administrator_username = var.administrator_username
  administrator_password = var.administrator_password
}

module "servicebus" {
  source                    = "../modules/servicebus"
  servicebus_namespace_name = var.servicebus_namespace_name
  resource_group_name       = module.resource-group.name
  location                  = module.resource-group.location
  tags                      = var.tags
}

module "aks-cluster" {
  source              = "../modules/aks-cluster"
  resource_group_name = module.resource-group.name
  location            = module.resource-group.location
  aks_name            = var.aks_name
  node_count          = var.node_count
}

data "azurerm_kubernetes_cluster" "credentials" {
  name                = var.aks_name
  resource_group_name = module.resource-group.name
}

provider "helm" {
  kubernetes {
    host                   = data.azurerm_kubernetes_cluster.credentials.kube_config.0.host
    client_certificate     = base64decode(data.azurerm_kubernetes_cluster.credentials.kube_config.0.client_certificate)
    client_key             = base64decode(data.azurerm_kubernetes_cluster.credentials.kube_config.0.client_key)
    cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.credentials.kube_config.0.cluster_ca_certificate)
  }
}

resource "helm_release" "nginx" {
  name       = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"

  set {
    name  = "controller.service.annotations.service.beta.kubernetes.io/azure-load-balancer-health-probe-request-path'"
    value = "/healthz"
  }

  set {
    name  = "controller.service.externalTrafficPolicy"
    value = "Local"
  }
}