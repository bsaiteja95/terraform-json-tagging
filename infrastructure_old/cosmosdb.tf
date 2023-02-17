resource "azurerm_cosmosdb_account" "cosmosdb_account" {
  name                = "sai-lab-cosmos-db-${random_integer.random.result}"
  location            = azurerm_resource_group.rs_gp.location
  resource_group_name = azurerm_resource_group.rs_gp.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"
  enable_automatic_failover = true

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }

  geo_location {
    location = "West US"
    failover_priority = 1
  }
  geo_location {
    location = "East US"
    failover_priority = 0
  }
}

resource "azurerm_cosmosdb_sql_database" "sql_db" {
  name                = "sai-lab-cosmos-sql-db"
  resource_group_name = azurerm_resource_group.rs_gp.name
  account_name        = azurerm_cosmosdb_account.cosmosdb_account.name
  throughput          = 400
}

resource "azurerm_cosmosdb_sql_container" "example" {
  name                  = "sai-lab-cosmos-sql-container"
  resource_group_name   = azurerm_resource_group.rs_gp.name
  account_name          = azurerm_cosmosdb_account.cosmosdb_account.name
  database_name         = azurerm_cosmosdb_sql_database.sql_db.name
  partition_key_path    = "/studentid"
  partition_key_version = 1
  throughput            = 400
}