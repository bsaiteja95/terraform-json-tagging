output "cosmos_account_id" {
  value = azurerm_cosmosdb_account.cosmosdb_account.id
}

output "cosmos_account_endpoint" {
  value = azurerm_cosmosdb_account.cosmosdb_account.endpoint
}

output "cosmos_account_read_endpoints" {
  value = azurerm_cosmosdb_account.cosmosdb_account.read_endpoints
}

output "cosmos_account_write_endpoints" {
  value = azurerm_cosmosdb_account.cosmosdb_account.write_endpoints
}

output "cosmos_account_primary_key" {
  sensitive = true
  value     = azurerm_cosmosdb_account.cosmosdb_account.primary_key
}

output "cosmos_account_secondary_key" {
  sensitive = true
  value     = azurerm_cosmosdb_account.cosmosdb_account.secondary_key
}

output "cosmos_account_primary_readonly_key" {
  sensitive = true
  value     = azurerm_cosmosdb_account.cosmosdb_account.primary_readonly_key
}

output "cosmos_account_secondary_readonly_key" {
  sensitive = true
  value     = azurerm_cosmosdb_account.cosmosdb_account.secondary_readonly_key
}

output "sql_db_id" {
  value = azurerm_cosmosdb_sql_container.sql_conatiner.id
}

output "sql_conatiner_id" {
  value = azurerm_cosmosdb_sql_database.sql_db.id
}