output "database_id" {
    value = azurerm_postgresql_flexible_server.database.id
    description = "The ID of the PostgreSQL database server."
}