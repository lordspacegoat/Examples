resource "azurerm_network_interface" "example1" {
  name                = "example-nic1"
  location            = azurerm_resource_group.terraform-demo.location
  resource_group_name = azurerm_resource_group.terraform-demo.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     =  azurerm_subnet.terraform-demo4.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "example2" {
  name                = "example-nic2"
  location            = azurerm_resource_group.terraform-demo.location
  resource_group_name = azurerm_resource_group.terraform-demo.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     =  azurerm_subnet.terraform-demo5.id
    private_ip_address_allocation = "Dynamic"
  }
}






resource "azurerm_linux_virtual_machine" "bastion" {
  name                = "bastion-machine"
  location            = azurerm_resource_group.terraform-demo.location
  resource_group_name = azurerm_resource_group.terraform-demo.name
  network_interface_ids = [azurerm_network_interface.example1.id,]
  size                = "Standard_A1_v2"
  disable_password_authentication = false


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}



resource "azurerm_linux_virtual_machine" "nfs" {
  name                = "nfs-machine"
  location            = azurerm_resource_group.terraform-demo.location
  resource_group_name = azurerm_resource_group.terraform-demo.name
  network_interface_ids = [azurerm_network_interface.example2.id,]
  size                = "Standard_A1_v2"
  admin_username      = "adminuser"
  admin_password      = "Password1234!"
  disable_password_authentication = false

  #admin_ssh_key {
  #  username   = "adminuser"
  #  public_key = file("~/.ssh/id_rsa.pub")
  #}

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}


