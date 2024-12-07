gh_uai_name = "gh-lfm-identity"
github_organization_target = "ThijmenBrand-LifeManager"
github_repository = "infrastructure"
environment = "development"
container_name = "tfstate"
automatic_container_name = "tfstate-aks-automatic"
storage_account_name = "lifemanagertfstate"
tf_state_rg_name = "lfm-rg-tfstate"
identity_rg_name = "lfm-rg-identity"
location = "northeurope"
tags = {
  environment = "dev"
  owner = "thijmenbrand"
}