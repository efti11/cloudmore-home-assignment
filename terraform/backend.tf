terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstateeftihis"
    container_name       = "tfstate"
    key                  = "cloudmore.tfstate"
  }
}
