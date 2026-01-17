resource "azurerm_network_security_group" "angabo-security-group" {
  name                = "${var.prefix}-security-group"
  location            = var.sweden-location
  resource_group_name = azurerm_resource_group.angabo.name


  dynamic "security_rule" {
    for_each = var.security-groups
    content {
      name                       = security_rule.value.name
      description                = security_rule.value.description
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }

  tags = {
    environment = "Production"
  }
}

resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.main.id
  network_security_group_id = azurerm_network_security_group.angabo-security-group.id
}