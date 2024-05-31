provider "azurerm" {
  features {}
}



resource "azurerm_resource_group" "davidrg" {
  name     = "david_resource_group"
  location = "West Europe"
}
