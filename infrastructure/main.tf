# Create a resource group
resource "azurerm_resource_group" "rs_gp" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

module "linux_function" {
  source = "../modules/linux_function"

  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location

  storage_account_name      = var.storage_account_name
  storage_account_tier      = var.storage_account_tier
  account_replication_type  = var.account_replication_type
  enable_https_traffic_only = var.enable_https_traffic_only

  app_insight_name     = var.app_insight_name
  app_insight_app_type = var.app_insight_app_type

  service_plan_name     = var.service_plan_name
  service_plan_kind     = var.service_plan_kind
  service_plan_reserved = var.service_plan_reserved
  service_plan_sku_tier = var.service_plan_sku_tier
  service_plan_sku_size = var.service_plan_sku_size

  function_app_name       = var.function_app_name
  function_only_https     = var.function_only_https
  function_python_version = var.function_python_version

  tags_complex_url = var.tags_complex_url
  tags_simple_url  = var.tags_simple_url
}

module "cosmosdb" {
  source = "../modules/cosmosdb"

  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location

  cosmosdb_account_name               = var.cosmosdb_account_name
  cosmosdb_account_offer_type         = var.cosmosdb_account_offer_type
  cosmosdb_account_kind               = var.cosmosdb_account_kind
  cosmosdb_account_automatic_failover = var.cosmosdb_account_automatic_failover
  consistency_level                   = var.consistency_level
  max_interval_in_seconds             = var.max_interval_in_seconds
  max_staleness_prefix                = var.max_staleness_prefix
  first_failover_location             = var.first_failover_location
  second_failover_location            = var.second_failover_location

  sql_db_name       = var.sql_db_name
  sql_db_throughput = var.sql_db_throughput

  sql_container_name       = var.sql_container_name
  sql_container_throughput = var.sql_container_throughput
  partition_key_version    = var.partition_key_version
  partition_key_path       = var.partition_key_path

  tags_complex_url = var.tags_complex_url
  tags_simple_url  = var.tags_simple_url
}

module "rediscache" {
  source = "../modules/redis"

  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location

  redis_cache_name            = var.redis_cache_name
  redis_cache_capacity        = var.redis_cache_capacity
  redis_cache_family          = var.redis_cache_family
  redis_cache_sku             = var.redis_cache_sku
  redis_cache_ssl_port        = var.redis_cache_ssl_port
  redis_cache_min_tls_version = var.redis_cache_min_tls_version

  tags_complex_url = "https://api.coindesk.com/v1/bpi/currentprice.json"
  tags_simple_url  = "https://api.agify.io?name=bella"
}
