resource "azurerm_postgresql_flexible_server" "database" {
  name                          = local.postgres_name
  resource_group_name           = azurerm_resource_group.resourcegroup.name
  location                      = azurerm_resource_group.resourcegroup.location
  version                       = "16"
  public_network_access_enabled = true
  administrator_login           = "psqladmin"
  administrator_password        = "H@Sh1CoR3!"

  storage_mb   = 32768
  storage_tier = "P4"

  sku_name   = "B_Standard_B1ms"

  authentication {
    active_directory_auth_enabled = true
    tenant_id = data.azurerm_client_config.current.tenant_id
  }

  tags = {
    environment = local.env
  }

  depends_on = [
    azurerm_resource_group.resourcegroup
  ]
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "database_firewall_client" {
  name = "ClientIpAddress"
  server_id        = azurerm_postgresql_flexible_server.database.id
  start_ip_address = "${chomp(data.http.myip.response_body)}"
  end_ip_address   = "${chomp(data.http.myip.response_body)}"
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "database_firewall_all" {
  name = "AllIps"
  server_id        = azurerm_postgresql_flexible_server.database.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "255.255.255.255"
}

resource "azurerm_postgresql_flexible_server_active_directory_administrator" "database_ad_admin" {
  server_name = azurerm_postgresql_flexible_server.database.name
  resource_group_name = azurerm_resource_group.resourcegroup.name
  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azuread_user.azure_config.object_id
  principal_name = data.azuread_user.azure_config.display_name
  principal_type = "User"
}


resource "terraform_data" "roles_setup" {
  depends_on = [
    azurerm_postgresql_flexible_server.database,
    azurerm_postgresql_flexible_server_firewall_rule.database_firewall_client,
    azurerm_postgresql_flexible_server_firewall_rule.database_firewall_all,
    azurerm_postgresql_flexible_server_active_directory_administrator.database_ad_admin
  ]

  provisioner "local-exec" {
    command = <<EOT
      export PGPASSWORD=H@Sh1CoR3!
      psql -h ${azurerm_postgresql_flexible_server.database.name}.postgres.database.azure.com -p 5432 -U psqladmin -d postgres -f create_server_roles.sql
    EOT
  }
}