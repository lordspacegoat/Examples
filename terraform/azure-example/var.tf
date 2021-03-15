# Global
variable "location" {
    default = "Central India"
}

# Resource Group
variable "name" {
    default = "platform-dev-rg"
}

# Resource Tags
variable "r-tags" {
    type = map
    default = {
        "owner"    = "email"
        "appname"  = "FRP"
        "category" = "JIO"
        "env"      = "ST"
    }
}

# Virtual Network
variable "vn-name" {
    default = "Platform-dev-Vnet"
}

variable "vn-addspace" {
    default = "10.0.0.0/16"
}

variable "vn-subnets" {
    type = map
    default = {
        "s1"  = "10.0.0.0/23"
        "s2"  = "10.0.4.0/24"
        "s3"  = "10.0.5.0/24"
        "s4"  = "10.0.7.0/24"
        "s5"  = "10.0.9.0/24"
        "s1_name"  = "name-cluster"
        "s2_name"  = "name-gpu-cluster"
        "s3_name"  = "name-rabbitmq-cluster"
        "s4_name"  = "name-bastion"
        "s5_name"  = "name-nfs"
    }
}


# VM

# Azure Storage 1
variable "st-info1" {
    type = map
    default = {
        "name"                     = "name"
        "account_tier"             = "Standard"
        "account_replication_type" = "LRS"
        "container_name"          = "name"
        "container_access_type"    = "private"
    }
}


# Azure Storage 2
variable "st-info2" {
    type = map
    default = {
        "name"                     = "name"
        "account_tier"             = "Standard"
        "account_replication_type" = "LRS"
        "container_name"          = "name"
        "container_access_type"    = "private"
    }
}

# Postgres Server

variable "pg-server" {
    type = map
    default = {
        "name"                         = "name-postgres-server"
        "version"                      = "9.6"
        "storage_mb"                   = "5120"
        "sku_name"                     = "GP_Gen5_2"
        "backup_retention_days"        = "7"
        "geo_redundant_backup_enabled" = false
        "auto_grow_enabled"            = true
        "ssl_enforcement_enabled"      = false
        "public_network_access_enabled"= false
    }
}

variable "pg-cred" {
    type = map
    default = {
        "username" = "name"
        "password" = "pw"
    }
}



variable "pg-firewall" {
    type = map
    default = {
        "name"              = "public"
        "start_ip_address"  = "0.0.0.0"
        "end_ip_address"    = "255.255.255.255"
    }
}

# Database Details
variable "db-info" {
    type = map
    default = {
        "name"     = "fr"
        "charset"  = "UTF8"
        "collation"= "English_United States.1252"
    }
}




