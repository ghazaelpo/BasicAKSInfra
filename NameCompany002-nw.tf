# -----------------------------------------------
# Production Virtual Network and Subnetwork
# -----------------------------------------------

resource "azurerm_virtual_network" "VNetProd" {
  name                = "example-vnet"
  address_space       = ["11.0.0.0/16"]
  location            = azurerm_resource_group.landingZone.location
  resource_group_name = azurerm_resource_group.landingZone.name
}

resource "azurerm_subnet" "SubnetProd" {
  name                 = "mySubnet1"
  resource_group_name  = azurerm_resource_group.landingZone.name
  virtual_network_name = azurerm_virtual_network.VNetProd.name
  address_prefixes     = ["11.0.1.0/24"]
}

# -----------------------------------------------
# Non Production Virtual Network and Subnetwork
# -----------------------------------------------

resource "azurerm_virtual_network" "VNetNonProd" {
  name                = "example-vnet2"
  address_space       = ["12.0.0.0/16"]
  location            = azurerm_resource_group.landingZone.location
  resource_group_name = azurerm_resource_group.landingZone.name
}

resource "azurerm_subnet" "NonProdSubnet" {
  name                 = "mySubnet2"
  resource_group_name  = azurerm_resource_group.landingZone.name
  virtual_network_name = azurerm_virtual_network.VNetNonProd.name
  address_prefixes     = ["12.0.1.0/24"]
  
}