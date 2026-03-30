
resource "azurerm_windows_virtual_machine" "vm" {
  name                  = "${var.environment_name}-${var.application_name}-vm"
  resource_group_name   = azurerm_resource_group.main.name
  location              = azurerm_resource_group.main.location
  size                  = "Standard_D2s_v4"
  admin_username        = var.username
  admin_password        = var.password
  network_interface_ids = [azurerm_network_interface.nic.id, ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}
