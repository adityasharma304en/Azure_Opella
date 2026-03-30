

# This Module is alligned with Netwoking components creation

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.environment_name}-${var.application_name}-vnet"
  address_space       = ["${var.address_space}"]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "${var.environment_name}-subnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["${var.address_prefixes}"]
}

resource "azurerm_network_interface" "nic" {
  name                = "${var.environment_name}-${var.application_name}-nic"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "${var.environment_name}-${var.application_name}-nic-ip"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}
