resource "azurerm_virtual_network" "vnet1" {
  name                = "virtual-network1"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.davidrg.location
  resource_group_name = azurerm_resource_group.davidrg.name
}



resource "azurerm_subnet" "subnetA" {
  name                 = "david_subnet"
  resource_group_name  = azurerm_resource_group.davidrg.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.0.2.0/24"]
}



resource "azurerm_network_interface" "main_nic" {
  name                = "david-nic"
  location            = azurerm_resource_group.davidrg.location
  resource_group_name = azurerm_resource_group.davidrg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnetA.id
    private_ip_address_allocation = "Dynamic"
  }
}



resource "azurerm_network_security_group" "davidnsg" {
  name                = "david-nsg"
  location            = azurerm_resource_group.davidrg.location
  resource_group_name = azurerm_resource_group.davidrg.name
}

resource "azurerm_network_interface_security_group_association" "nic_ngs_assoc1" {
  network_interface_id      = azurerm_network_interface.main_nic.id
  network_security_group_id = azurerm_network_security_group.davidnsg.id
}

resource "azurerm_network_security_rule" "http-rule" {
  name                        = "http"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  resource_group_name         = azurerm_resource_group.davidrg.name
  network_security_group_name = azurerm_network_security_group.davidnsg.name
}



resource "azurerm_public_ip" "public_address" {
name = "public_address1"
allocation_method = "Dynamic"
location = azurerm_resource_group.davidrg.location
resource_group_name = azurerm_resource_group.davidrg.name


}






