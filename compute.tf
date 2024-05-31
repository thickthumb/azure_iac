resource "azurerm_linux_virtual_machine" "davidvm1" {
  name                = "host-machine"
  resource_group_name = azurerm_resource_group.davidrg.name
  location            = azurerm_resource_group.davidrg.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  
  network_interface_ids = [
    azurerm_network_interface.main_nic.id,
  ]


  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}


resource "azurerm_virtual_machine_run_command" "basic_rcmd" {
  name               = "LampInstall_cmd"
  location           = azurerm_resource_group.davidrg.location
  virtual_machine_id = azurerm_linux_virtual_machine.davidvm1.id
  source {
    script = "apt-get update && apt-get install -y apache2"
  }
}


