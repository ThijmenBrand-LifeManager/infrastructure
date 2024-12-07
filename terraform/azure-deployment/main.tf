module "resource-group" {
  source   = "../modules/resource-group"
  name     = "${var.resource_group_name}-${var.env}"
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