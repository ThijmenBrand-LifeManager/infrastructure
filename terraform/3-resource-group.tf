resource "azurerm_resource_group" "resourcegroup" {
  name     = local.resource_group_name
  location = local.region

  tags = {
    source = "terraform"
    environment = local.env
  }
}