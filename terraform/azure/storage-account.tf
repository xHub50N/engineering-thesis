resource "azurerm_storage_account" "angabo-storageaccount" {
  name                     = var.prefix
  resource_group_name      = azurerm_resource_group.angabo.name
  location                 = azurerm_resource_group.angabo.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "production"
  }
}

resource "azurerm_storage_container" "etcd-backup" {
  name                  = "etcd-backup"
  storage_account_name  = azurerm_storage_account.angabo-storageaccount.name
  container_access_type = "private"
}
resource "azurerm_storage_container" "netbird-backup" {
  name                  = "netbird-backup"
  storage_account_name  = azurerm_storage_account.angabo-storageaccount.name
  container_access_type = "private"
}
resource "azurerm_storage_container" "pg-backup" {
  name                  = "pg-backup"
  storage_account_name  = azurerm_storage_account.angabo-storageaccount.name
  container_access_type = "private"
}
resource "azurerm_storage_container" "pve-backup" {
  name                  = "pve-backup"
  storage_account_name  = azurerm_storage_account.angabo-storageaccount.name
  container_access_type = "private"
}
resource "azurerm_storage_container" "pve-cluster-backup" {
  name                  = "pve-cluster-backup"
  storage_account_name  = azurerm_storage_account.angabo-storageaccount.name
  container_access_type = "private"
}