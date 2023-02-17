output "redis_cache_id" {
  value = azurerm_redis_cache.redis_cache.id
}

output "redis_cache_hostname" {
  value = azurerm_redis_cache.redis_cache.hostname
}

output "redis_cache_ssl_port" {
  value = azurerm_redis_cache.redis_cache.ssl_port
}

output "redis_cache_port" {
  value = azurerm_redis_cache.redis_cache.port
}

output "redis_cache_primary_access_key" {
  sensitive = true
  value     = azurerm_redis_cache.redis_cache.primary_access_key
}

output "redis_cache_secondary_access_key" {
  sensitive = true
  value     = azurerm_redis_cache.redis_cache.secondary_access_key
}

output "redis_cache_primary_connection_string" {
  sensitive = true
  value     = azurerm_redis_cache.redis_cache.primary_connection_string
}

output "redis_cache_secondary_connection_string" {
  sensitive = true
  value     = azurerm_redis_cache.redis_cache.secondary_connection_string
}
