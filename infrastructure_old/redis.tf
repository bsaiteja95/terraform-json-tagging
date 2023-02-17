resource "azurerm_redis_cache" "example" {
  name                = "sai-lab-redis-cache-${random_integer.random.result}"
  location            = azurerm_resource_group.rs_gp.location
  resource_group_name = azurerm_resource_group.rs_gp.name
  capacity            = 2
  family              = "C"
  sku_name            = "Standard"
  enable_non_ssl_port = false
  minimum_tls_version = "1.2"

}