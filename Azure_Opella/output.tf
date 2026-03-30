
# This Module is alligned with Output store, these value can be used to pass variables to be utilized whereever needed.


output "network_component_location" {
  value = azurerm_resource_group.main.location
}


output "primary_location" {
  value = var.primary_location
}
