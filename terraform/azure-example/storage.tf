# Azure Blob Storage1
resource "azurerm_storage_account" "terraform-demo1" {
  name                     = var.st-info1["name"]
  location                 = azurerm_resource_group.terraform-demo.location
  resource_group_name      = azurerm_resource_group.terraform-demo.name
  account_tier             = var.st-info1["account_tier"]
  account_replication_type = var.st-info1["account_replication_type"]

  tags = {
    OWNER    = var.r-tags["owner"]
    APPNAME  = var.r-tags["appname"]
    CATEGORY = var.r-tags["category"]
    ENV      = var.r-tags["env"]
  }
}

# Container 1
resource "azurerm_storage_container" "terraform-demo1" {
  name                  = var.st-info1["container_name"]
  storage_account_name  = azurerm_storage_account.terraform-demo1.name
  container_access_type = var.st-info1["container_access_type"]
}




# Azure Blob Storage2
resource "azurerm_storage_account" "terraform-demo2" {
  name                     = var.st-info2["name"]
  location                 = azurerm_resource_group.terraform-demo.location
  resource_group_name      = azurerm_resource_group.terraform-demo.name
  account_tier             = var.st-info2["account_tier"]
  account_replication_type = var.st-info2["account_replication_type"]

  tags = {
    OWNER    = var.r-tags["owner"]
    APPNAME  = var.r-tags["appname"]
    CATEGORY = var.r-tags["category"]
    ENV      = var.r-tags["env"]
  }
}

# Container 2
resource "azurerm_storage_container" "terraform-demo2" {
  name                  = var.st-info2["container_name"]
  storage_account_name  = azurerm_storage_account.terraform-demo2.name
  container_access_type = var.st-info2["container_access_type"]
}
