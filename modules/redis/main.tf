# # Create a resource group
# resource "azurerm_resource_group" "rs_gp" {
#   name     = var.resource_group_name
#   location = var.resource_group_location
#   tags     = var.tags
# }

resource "random_integer" "redis_random" {
  min = var.min_random_int
  max = var.max_random_int
  keepers = {
    # Generate a new integer each time we switch to a new listener ARN
    new_storage_account = var.create_new_infra
  }
}

resource "azurerm_redis_cache" "redis_cache" {
  name                = "${var.resource_group_name}-${var.redis_cache_name}-${random_integer.redis_random.result}"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  capacity            = var.redis_cache_capacity
  family              = var.redis_cache_family
  sku_name            = var.redis_cache_sku
  enable_non_ssl_port = var.redis_cache_ssl_port
  minimum_tls_version = var.redis_cache_min_tls_version
  tags                = merge(local.final_simple_tags, local.final_complex_tags)

}