resource "azurerm_servicebus_namespace" "azure_servicebus" {
  name                  = var.servicebus_namespace_name
  resource_group_name   = var.resource_group_name
  location              = var.location
  sku                   = "Standard"

  tags = var.tags
}

resource "azurerm_user_assigned_identity" "authorization_identity" {
  location = var.location
  resource_group_name = var.resource_group_name
  name = "lfm-authorization-identity"
}

resource "azurerm_role_assignment" "authorization_identity_servicebus_access" {
  scope                = azurerm_servicebus_namespace.azure_servicebus.id
  role_definition_name = "Azure Service Bus Data Owner"
  principal_id         = azurerm_user_assigned_identity.authorization_identity.principal_id
}

resource "azurerm_user_assigned_identity" "workstream_identity" {
  location = var.location
  resource_group_name = var.resource_group_name
  name = "lfm-workstream-identity"
}

resource "azurerm_role_assignment" "workstream_identity_servicebus_access" {
  scope                = azurerm_servicebus_namespace.azure_servicebus.id
  role_definition_name = "Azure Service Bus Data Owner"
  principal_id         = azurerm_user_assigned_identity.workstream_identity.principal_id
}
