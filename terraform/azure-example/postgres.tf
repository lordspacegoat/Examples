# Azure Postgres Setup
resource "azurerm_postgresql_server" "terraform-demo" {
  name                = var.pg-server["name"]
  location            = azurerm_resource_group.terraform-demo.location
  resource_group_name = azurerm_resource_group.terraform-demo.name

  administrator_login          = var.pg-cred["username"]
  administrator_login_password = var.pg-cred["password"]

  sku_name   = var.pg-server["sku_name"]
  version    = var.pg-server["version"]
  storage_mb = var.pg-server["storage_mb"]

  backup_retention_days        = var.pg-server["backup_retention_days"]
  geo_redundant_backup_enabled = var.pg-server["geo_redundant_backup_enabled"]
  auto_grow_enabled            = var.pg-server["auto_grow_enabled"]
  ssl_enforcement_enabled          = var.pg-server["ssl_enforcement_enabled"]


  tags = {
    OWNER    = var.r-tags["owner"]
    APPNAME  = var.r-tags["appname"]
    CATEGORY = var.r-tags["category"]
    ENV      = var.r-tags["env"]
  }
}

resource "azurerm_postgresql_database" "terraform-demo" {
  name                = var.db-info["name"]
  resource_group_name = azurerm_resource_group.terraform-demo.name
  server_name         = azurerm_postgresql_server.terraform-demo.name
  charset             = var.db-info["charset"]
  collation           = var.db-info["collation"]
}
