output "authorization_identity_principal_id" {
    value = azurerm_user_assigned_identity.authorization_identity.principal_id
    description = "The principal ID of the authorization user-assigned managed identity."
}

output "workstream_identity_principal_id" {
    value = azurerm_user_assigned_identity.workstream_identity.principal_id
    description = "The principal ID of the workstream user-assigned managed identity."
}