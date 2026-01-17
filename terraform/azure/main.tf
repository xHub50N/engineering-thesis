resource "azurerm_resource_group" "angabo" {
  name     = var.prefix
  location = "polandcentral"
}

resource "azurerm_public_ip" "public_ip" {
  name                = "${var.prefix}-public-ip"
  location            = var.sweden-location
  resource_group_name = azurerm_resource_group.angabo.name
  allocation_method   = "Static"
}

resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/16"]
  location            = var.sweden-location
  resource_group_name = azurerm_resource_group.angabo.name
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.angabo.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "main" {
  name                = "${var.prefix}-nic"
  location            = var.sweden-location
  resource_group_name = azurerm_resource_group.angabo.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}