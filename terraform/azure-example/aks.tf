resource "azurerm_kubernetes_cluster" "example" {
  name                = "example-aks1"
  location            = azurerm_resource_group.terraform-demo.location
  resource_group_name = azurerm_resource_group.terraform-demo.name
  dns_prefix          = "aksexampleforenv"

  default_node_pool {
    name           = "system"
    node_count     = 1
    vm_size        = "Standard_D2_v2"
    vnet_subnet_id   = azurerm_subnet.terraform-demo1.id
  }

  identity {
    type = "SystemAssigned"
  }

  addon_profile {
    aci_connector_linux {
      enabled = false
    }

    azure_policy {
      enabled = false
    }

    http_application_routing {
      enabled = false
    }

    kube_dashboard {
      enabled = true
    }

    oms_agent {
      enabled = false
    }
  }


    network_profile {
    network_plugin     = "azure"
    network_policy     = "azure"
    service_cidr       = "192.168.0.0/16"
    dns_service_ip     = "192.168.0.10"
    docker_bridge_cidr = "172.17.0.1/16"

  }
}


resource "azurerm_kubernetes_cluster_node_pool" "user" {
  name                  = "render"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.example.id
  vm_size               = "Standard_D2_v2"
  node_count            = 1
  vnet_subnet_id      =  azurerm_subnet.terraform-demo2.id
}

resource "azurerm_kubernetes_cluster_node_pool" "users" {
  name                  = "event"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.example.id
  vm_size               = "Standard_D2_v2"
  node_count            = 1
  vnet_subnet_id       =  azurerm_subnet.terraform-demo3.id
}
