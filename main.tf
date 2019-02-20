data "azurerm_resource_group" "rg_treasury" {
  name = "${var.product_rg_name}"
}

resource "azurerm_storage_account" "stor_treasuryauditportal" {
  name                     =  "${var.env_prefix}treasuryauditportal"
  resource_group_name      =  "${data.azurerm_resource_group.rg_treasury.name}"
  location                 =  "${var.location}"
  account_tier             =  "Standard"
  account_kind             =  "StorageV2"
  account_replication_type =  "RAGRS"

  provisioner "local-exec" {
    command = "az extension add --name storage-preview && az storage blob service-properties update --account-name ${azurerm_storage_account.stor_treasuryauditportal.name} --static-website  --index-document index.html --404-document 404.html"
  }

}

resource "azurerm_storage_account" "stor_treasuryportal" {
  name                     =  "${var.env_prefix}treasuryportal"
  resource_group_name      =  "${data.azurerm_resource_group.rg_treasury.name}"
  location                 =  "${var.location}"
  account_tier             =  "Standard"
  account_kind             =  "StorageV2"
  account_replication_type =  "RAGRS"

  provisioner "local-exec" {
    command = "az extension add --name storage-preview && az storage blob service-properties update --account-name ${azurerm_storage_account.stor_treasuryportal.name} --static-website  --index-document index.html --404-document 404.html"
  }

}