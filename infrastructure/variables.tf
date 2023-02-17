# Basic variables for this project

variable "resource_group_name" {
  type    = string
  default = "sai-lab-1"
}

variable "resource_group_location" {
  type    = string
  default = "East US"
}

/////////////////////////////////////////////------LINUX-FUNCTION-APP-VARIABLES---------//////////////////////////////////////////////

# storage account variables. storage account name is automatically deduced and will be unique.

variable "storage_account_name" {
  type    = string
  default = "sailab78"
}

variable "storage_account_tier" {
  type    = string
  default = "Standard"
}

variable "account_replication_type" {
  type    = string
  default = "LRS"
}

variable "enable_https_traffic_only" {
  type    = bool
  default = true
}

# variables for application insights for our azure linux function app

variable "app_insight_name" {
  type    = string
  default = "linux-function-app-insights"
}

variable "app_insight_app_type" {
  type    = string
  default = "web"
}

# variables for service plan

variable "service_plan_name" {
  type    = string
  default = "linux-function-app-service-plan"
}

variable "service_plan_kind" {
  type    = string
  default = "Linux"
}

variable "service_plan_reserved" {
  type    = bool
  default = true
}

variable "service_plan_sku_tier" {
  type    = string
  default = "Standard"
}

variable "service_plan_sku_size" {
  type    = string
  default = "S1"
}

# variables for linux function app

variable "function_app_name" {
  type        = string
  description = "The given name will be appened with resource group name and a randon integer to make it unique"
  default     = "linux-function-app"
}

variable "function_only_https" {
  type    = bool
  default = true
}

variable "function_python_version" {
  type    = number
  default = 3.9
}

/////////////////////////////////////////////------COSMOS-DB-VARIABLES---------//////////////////////////////////////////////

# variables for CosmosDB account

variable "cosmosdb_account_name" {
  type    = string
  default = "cosmos-db"
}

variable "cosmosdb_account_offer_type" {
  type    = string
  default = "Standard"
}

variable "cosmosdb_account_kind" {
  type    = string
  default = "GlobalDocumentDB"
}

variable "cosmosdb_account_automatic_failover" {
  type    = bool
  default = true
}

variable "consistency_level" {
  type    = string
  default = "BoundedStaleness"
}

variable "max_interval_in_seconds" {
  type    = number
  default = 300
}

variable "max_staleness_prefix" {
  type    = number
  default = 100000
}

variable "first_failover_location" {
  type    = string
  default = "East US"
}

variable "second_failover_location" {
  type    = string
  default = "West US"
}

# variables for CosmosDB sql database

variable "sql_db_name" {
  type    = string
  default = "cosmos-sql-db"
}

variable "sql_db_throughput" {
  type    = number
  default = 400
}

# variables for CosmosDB sql container

variable "sql_container_name" {
  type    = string
  default = "cosmos-sql-container"
}

variable "sql_container_throughput" {
  type    = number
  default = 400
}

variable "partition_key_version" {
  type    = number
  default = 1
}

variable "partition_key_path" {
  type    = string
  default = "/studentid"
}

/////////////////////////////////////////////------REDIS-CACHE-VARIABLES---------//////////////////////////////////////////////

# variables for redis cache

variable "redis_cache_name" {
  type    = string
  default = "redis-cache"
}

variable "redis_cache_capacity" {
  type    = number
  default = 2
}

variable "redis_cache_family" {
  type    = string
  default = "C"
}

variable "redis_cache_sku" {
  type    = string
  default = "Standard"
}

variable "redis_cache_ssl_port" {
  type    = bool
  default = false
}

variable "redis_cache_min_tls_version" {
  type    = number
  default = 1.2
}

# generic tags

variable "tags_complex_url" {
  type    = string
  default = ""
}

variable "tags_simple_url" {
  type    = string
  default = ""
}
