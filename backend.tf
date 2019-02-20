terraform {
  backend "azurerm" {
    resource_group_name   = "Treasury-FundingPlatform-EC2-STG"
    storage_account_name  = "terraformtreasury"
    container_name        = "tfstates"
  }
}