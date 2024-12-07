data "http" "myip" {
  url = "https://ipv4.icanhazip.com"
}

resource "azurerm_postgresql_flexible_server" "database" {
  name                          = var.postgres_server_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  version                       = var.postgres_version
  public_network_access_enabled = true
  administrator_login           = var.administrator_username
  administrator_password        = var.administrator_password

  storage_mb   = 32768
  storage_tier = "P4"

  sku_name   = "B_Standard_B1ms"

  tags = var.tags
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

resource "terraform_data" "roles_setup" {
  depends_on = [
    azurerm_postgresql_flexible_server.database,
    azurerm_postgresql_flexible_server_firewall_rule.database_firewall_client,
    azurerm_postgresql_flexible_server_firewall_rule.database_firewall_all,
    azurerm_postgresql_flexible_server_active_directory_administrator.database_ad_admin
  ]

  provisioner "local-exec" {
    command = <<EOT
      export PGPASSWORD=${var.administrator_password}
      psql -h ${azurerm_postgresql_flexible_server.database.name}.postgres.database.azure.com -p 5432 -U psqladmin -d postgres -f ./resources/db_init.sql
    EOT
  }
}