resource "random_id" "prefix" {
  byte_length = 8
}

resource "azurerm_resource_group" "rg" {
  name     = local.rgName
  location = var.region
}

resource "azurerm_virtual_network" "vnet" {
  address_space       = ["10.99.0.0/16"]
  location            = azurerm_resource_group.rg.location
  name                = local.vnetName
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "a" {
  address_prefixes                               = ["10.99.0.0/20"]
  name                                           = "snet-hosts-a"
  resource_group_name                            = azurerm_resource_group.rg.name
  virtual_network_name                           = azurerm_virtual_network.vnet.name
}

resource "azurerm_subnet" "b" {
  address_prefixes                               = ["10.99.16.0/20"]
  name                                           = "snet-hosts-b"
  resource_group_name                            = azurerm_resource_group.rg.name
  virtual_network_name                           = azurerm_virtual_network.vnet.name
}

resource "azurerm_subnet" "databasesubnet" {
  address_prefixes                               = ["10.99.240.0/20"]
  name                                           = "snet-database"
  resource_group_name                            = azurerm_resource_group.rg.name
  virtual_network_name                           = azurerm_virtual_network.vnet.name
}

locals {
  nodes = {
    for i in range(1) : "worker${i}" => {
      name                  = substr("worker${i}${random_id.prefix.hex}", 0, 8)
      vm_size               = "Standard_D2s_v3"
      node_count            = 1
      vnet_subnet_id        = azurerm_subnet.a.id
      create_before_destroy = i % 2 == 0
    }
  }
}

module "aks" {
  source  = "Azure/aks/azurerm"
  version = "8.0.0"

  prefix              = "prefix-${random_id.prefix.hex}"
  cluster_name = join("-", ["aks", var.productName, var.env])
  # resource_group_name = "rg-aks"
  resource_group_name = azurerm_resource_group.rg.name
  # location = "eastus2"
  os_disk_size_gb     = 50
  sku_tier            = "Standard"
  rbac_aad = false
  log_analytics_workspace_enabled   = false
  role_based_access_control_enabled = false

  # create_role_assignments_for_application_gateway = true
  vnet_subnet_id      = azurerm_subnet.a.id
  node_pools          = local.nodes

  resource_group = "rg-my-cluster"
  aks_name = "my-cluster"
  admin_username = "my-user"
  node_count = 1
  auto_scaling_default_node = false
  node_min_count = null
  node_max_count = null
  default_node_vm_size = "Standard_DS2_v2"

  additional_node_pools = {
    "pooltest" = {
      vm_size = "Standard_DS2_v2"
      os_disk_size_gb = 100
      enable_auto_scaling = false
      availability_zones  = []
      node_count          = 1
      min_count           = null
      max_count           = null
      max_pods            = 110
      node_labels         = null
      taints              = null
    }
  }

}
