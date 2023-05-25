# Create a resource group
resource "azurerm_resource_group" "landingZone" {
  name     = "landing-zone"
  location = var.location
}