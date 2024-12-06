resource "azurerm_servicebus_namespace" "default" {
  name                  = local.servicebus_name
  resource_group_name   = azurerm_resource_group.resourcegroup.name
  location              = azurerm_resource_group.resourcegroup.location
  sku                   = "Standard"

  tags = {
    source = "terraform"
  }
}

resource "azurerm_user_assigned_identity" "authorization_identity" {
  location = azurerm_resource_group.resourcegroup.location
  resource_group_name = azurerm_resource_group.resourcegroup.name
  name = "lfm-authorization-identity"
}

resource "azurerm_role_assignment" "authorization_identity_servicebus_access" {
  scope                = azurerm_servicebus_namespace.default.id
  role_definition_name = "Azure Service Bus Data Owner"
  principal_id         = azurerm_user_assigned_identity.authorization_identity.principal_id
}

resource "azurerm_user_assigned_identity" "workstream_identity" {
  location = azurerm_resource_group.resourcegroup.location
  resource_group_name = azurerm_resource_group.resourcegroup.name
  name = "lfm-workstream-identity"
}

resource "azurerm_role_assignment" "workstream_identity_servicebus_access" {
  scope                = azurerm_servicebus_namespace.default.id
  role_definition_name = "Azure Service Bus Data Owner"
  principal_id         = azurerm_user_assigned_identity.workstream_identity.principal_id
}
