# Resource Group Creation
resource "azurerm_resource_group" "terraform-demo" {
  name     = var.name
  location = var.location

  tags = {
    OWNER    = var.r-tags["owner"]
    APPNAME  = var.r-tags["appname"]
    CATEGORY = var.r-tags["category"]
    ENV      = var.r-tags["env"]
  }
}
