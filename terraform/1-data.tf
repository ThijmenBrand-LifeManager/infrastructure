data "http" "myip" {
  url = "https://ipv4.icanhazip.com"
}

data "azurerm_client_config" "current" {}

data "azuread_user" "azure_config" {
  user_principal_name = "thijmen_ik.nu#EXT#@thijmenik.onmicrosoft.com"
}