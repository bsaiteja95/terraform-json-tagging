# output "resouce_group_name" {
#   value = azurerm_resource_group.rs_gp.name
# }

# output "resouce_group_location" {
#   value = azurerm_resource_group.rs_gp.location
# }

# output "resouce_group_id" {
#   value = azurerm_resource_group.rs_gp.id
# }

output "storage_account_name" {
  value = azurerm_storage_account.function_sg.name
}

output "storage_account_id" {
  value = azurerm_storage_account.function_sg.id
}

output "app_insight_name" {
  value = azurerm_application_insights.function-app-insights.name
}

output "app_insight_id" {
  value = azurerm_application_insights.function-app-insights.id
}

output "app_insight_instrumentation_key" {
  sensitive = true
  value     = azurerm_application_insights.function-app-insights.instrumentation_key
}

output "app_insight_connection_string" {
  sensitive = true
  value     = azurerm_application_insights.function-app-insights.connection_string
}

output "service_plan_name" {
  value = azurerm_app_service_plan.service_plan.name
}

output "service_plan_id" {
  value = azurerm_app_service_plan.service_plan.id
}

output "linux_function_app_name" {
  value = azurerm_linux_function_app.linux_function.name
}

output "linux_function_app_id" {
  value = azurerm_linux_function_app.linux_function.id
}

output "linux_function_app_hostname" {
  value = azurerm_linux_function_app.linux_function.default_hostname
}