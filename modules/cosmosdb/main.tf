# # Create a resource group
# resource "azurerm_resource_group" "rs_gp" {
#   name     = var.resource_group_name
#   location = var.resource_group_location
#   tags     = var.tags
# }

resource "random_integer" "cosmosdb_random" {
  min = var.min_random_int
  max = var.max_random_int
  keepers = {
    # Generate a new integer each time we switch to a new listener ARN
    new_storage_account = var.create_new_infra
  }
}

resource "azurerm_cosmosdb_account" "cosmosdb_account" {
  name                      = "${var.resource_group_name}-${var.cosmosdb_account_name}-${random_integer.cosmosdb_random.result}"
  location                  = var.resource_group_location
  resource_group_name       = var.resource_group_name
  offer_type                = var.cosmosdb_account_offer_type
  kind                      = var.cosmosdb_account_kind
  enable_automatic_failover = var.cosmosdb_account_automatic_failover
  tags                      = merge(local.final_simple_tags, local.final_complex_tags)

  consistency_policy {
    consistency_level       = var.consistency_level
    max_interval_in_seconds = var.max_interval_in_seconds
    max_staleness_prefix    = var.max_staleness_prefix
  }

  geo_location {
    location          = var.second_failover_location
    failover_priority = 1
  }
  geo_location {
    location          = var.first_failover_location
    failover_priority = 0
  }
}

resource "azurerm_cosmosdb_sql_database" "sql_db" {
  name                = "${var.resource_group_name}-${var.sql_db_name}"
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.cosmosdb_account.name
  throughput          = var.sql_db_throughput
}

resource "azurerm_cosmosdb_sql_container" "sql_conatiner" {
  name                  = "${var.resource_group_name}-${var.sql_container_name}"
  resource_group_name   = var.resource_group_name
  account_name          = azurerm_cosmosdb_account.cosmosdb_account.name
  database_name         = azurerm_cosmosdb_sql_database.sql_db.name
  partition_key_path    = var.partition_key_path
  partition_key_version = var.partition_key_version
  throughput            = var.sql_container_throughput
}