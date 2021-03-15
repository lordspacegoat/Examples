# Azure Virtual Network Creation
resource "azurerm_virtual_network" "terraform-demo" {
  name                = var.vn-name
  location            = azurerm_resource_group.terraform-demo.location
  resource_group_name = azurerm_resource_group.terraform-demo.name
  address_space       = [var.vn-addspace]
  }
  
resource "azurerm_subnet" "terraform-demo1" {
  name                 = var.vn-subnets["s1_name"]
  resource_group_name  = azurerm_resource_group.terraform-demo.name
  virtual_network_name = azurerm_virtual_network.terraform-demo.name
  address_prefix       = var.vn-subnets["s1"]
}

resource "azurerm_subnet" "terraform-demo2" {
  name                 = var.vn-subnets["s2_name"]
  resource_group_name  = azurerm_resource_group.terraform-demo.name
  virtual_network_name = azurerm_virtual_network.terraform-demo.name
  address_prefix       = var.vn-subnets["s2"]
}

resource "azurerm_subnet" "terraform-demo3" {
  name                 = var.vn-subnets["s3_name"]
  resource_group_name  = azurerm_resource_group.terraform-demo.name
  virtual_network_name = azurerm_virtual_network.terraform-demo.name
  address_prefix       = var.vn-subnets["s3"]
}

resource "azurerm_subnet" "terraform-demo4" {
  name                 = var.vn-subnets["s4_name"]
  resource_group_name  = azurerm_resource_group.terraform-demo.name
  virtual_network_name = azurerm_virtual_network.terraform-demo.name
  address_prefix       = var.vn-subnets["s4"]
}


resource "azurerm_subnet" "terraform-demo5" {
  name                 = var.vn-subnets["s5_name"]
  resource_group_name  = azurerm_resource_group.terraform-demo.name
  virtual_network_name = azurerm_virtual_network.terraform-demo.name
  address_prefix       = var.vn-subnets["s5"]
}




#
#  
#   subnet {
#     name           = var.vn-subnets["s1_name"]
#     address_prefix = var.vn-subnets["s1"]
#   }
#
#   subnet {
#     name           = var.vn-subnets["s2_name"]
#     address_prefix = var.vn-subnets["s2"]
#   }
#
#   subnet {
#     name           = var.vn-subnets["s3_name"]
#     address_prefix = var.vn-subnets["s3"]
#   }
#
#  tags = {
#    OWNER    = var.r-tags["owner"]
#    APPNAME  = var.r-tags["appname"]
#    CATEGORY = var.r-tags["category"]
#    ENV      = var.r-tags["env"]
#  }
#}
