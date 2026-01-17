variable "subscription_id" {
  type = string
}
variable "prefix" {
  default = "angabo"
}
variable "sweden-location" {
  default = "swedencentral"
}

variable "security-groups" {
  type = map(object({
    name                       = string
    description                = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  default = {
    "ssh-access" = {
      name                       = "ssh-access"
      description                = "Allow SSH access"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    "netbird-http" = {
      name                       = "netbird-http"
      description                = "Allow NetBird HTTP access"
      priority                   = 110
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    "netbird-https" = {
      name                       = "netbird-https"
      description                = "Allow NetBird HTTS access"
      priority                   = 120
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    "netbird-33073" = {
      name                       = "netbird-33073"
      description                = "Allow 33073 TCP access"
      priority                   = 130
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "33073"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    "netbird-10000" = {
      name                       = "netbird-10000"
      description                = "Allow 10000 TCP access"
      priority                   = 140
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "10000"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    "netbird-33080" = {
      name                       = "netbird-33080"
      description                = "Allow 33080 TCP access"
      priority                   = 150
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "33080"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    "netbird-3478" = {
      name                       = "netbird-3478"
      description                = "Allow 3478 UDP access"
      priority                   = 160
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "3478"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    "netbird-49152-65535" = {
      name                       = "netbird-49153-65535"
      description                = "Allow 49153-65535 UDP access"
      priority                   = 170
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "49152-65535"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}