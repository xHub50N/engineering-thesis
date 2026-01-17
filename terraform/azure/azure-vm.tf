resource "azurerm_virtual_machine" "main" {
  name                  = "${var.prefix}-vm"
  location              = var.sweden-location
  resource_group_name   = azurerm_resource_group.angabo.name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_B1ms"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "netbird"
    admin_username = "netbird"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = true

    ssh_keys {
      key_data = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDFt0D1bCybcqb2IYKOlwzWYJCYNyjzFdzzBe+i7NnAt root@PC"
      path     = "/home/netbird/.ssh/authorized_keys"
    }
  }
  tags = {
    environment = "production"
  }
}