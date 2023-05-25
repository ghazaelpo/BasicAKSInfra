# -------------------------------------------------------------
# Production Cluster
# -------------------------------------------------------------

resource "azurerm_kubernetes_cluster" "ProductionCluster" {
  name                = "production-cluster"
  location            = azurerm_resource_group.landingZone.location
  resource_group_name = azurerm_resource_group.landingZone.name
  dns_prefix          = "productionCluster"

  default_node_pool {
    name       = "default1"
    node_count = 1
    vm_size    = "Standard_D2_v2"
    vnet_subnet_id = azurerm_subnet.SubnetProd.id
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

output "client_certificate_production" {
  value     = azurerm_kubernetes_cluster.ProductionCluster.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config_production" {
  value = azurerm_kubernetes_cluster.ProductionCluster.kube_config_raw

  sensitive = true
}

# -------------------------------------------------------------
# Non Production Cluster
# -------------------------------------------------------------

resource "azurerm_kubernetes_cluster" "NonProductionCluster" {
  name                = "Non-production-cluster"
  location            = azurerm_resource_group.landingZone.location
  resource_group_name = azurerm_resource_group.landingZone.name
  dns_prefix          = "NonProductionCluster"

  default_node_pool {
    name       = "default2"
    node_count = 1
    vm_size    = "Standard_D2_v2"
    vnet_subnet_id = azurerm_subnet.NonProdSubnet.id
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Non-Production"
  }
}

output "client_certificate_non_production" {
  value     = azurerm_kubernetes_cluster.NonProductionCluster.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config_non_production" {
  value = azurerm_kubernetes_cluster.NonProductionCluster.kube_config_raw

  sensitive = true
}