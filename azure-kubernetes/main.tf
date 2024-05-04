# resource "azurerm_resource_group" "rg" {
#   name     = local.rgName
#   location = var.region
# }

# resource "azurerm_resource_group" "rgshared" {
#   name     = local.rgSharedName
#   location = var.region
# }

# resource "azurerm_container_registry" "acr" {
#   name      = local.acrName
#   resource_group_name = azurerm_resource_group.rgshared.name
#   location            = azurerm_resource_group.rgshared.location
#   sku                 = "Standard"
#   admin_enabled       = true
# }

module "aks" {
  source  = "Azure/aks/azurerm"
  version = "8.0.0"
  # insert the 1 required variable here
  create_resource_group = true
  create_role_assignments_for_application_gateway
}

