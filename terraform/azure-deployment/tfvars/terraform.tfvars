resource_group_name = "lfm-rg"
location = "northeurope"
tags = {
    environment = "dev"
    owner = "ThijmenBrand"
    application = "lifemanager"
}
postgres_server_name = "lfm-dev-pgsql-db"
servicebus_namespace_name = "lfm-dev-servicebus"
aks_name = "lfm-dev-k8s"
node_count = 1
env = "development"