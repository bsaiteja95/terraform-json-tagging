# # Create a resource group
# resource "azurerm_resource_group" "rs_gp" {
#   name     = var.resource_group_name
#   location = var.resource_group_location
#   tags     = local.final_tags
# }

resource "random_integer" "function_random" {
  min = var.min_random_int
  max = var.max_random_int
  keepers = {
    # Generate a new integer each time we switch to a new listener ARN
    new_storage_account = var.create_new_infra
  }
}


resource "azurerm_storage_account" "function_sg" {
  name                      = "${var.storage_account_name}${random_integer.function_random.result}"
  resource_group_name       = var.resource_group_name
  location                  = var.resource_group_location
  account_tier              = var.storage_account_tier
  account_replication_type  = var.account_replication_type
  enable_https_traffic_only = var.enable_https_traffic_only

  tags = merge(local.final_simple_tags, local.final_complex_tags)
}

resource "azurerm_application_insights" "function-app-insights" {
  name                = var.app_insight_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  application_type    = var.app_insight_app_type
  tags                = merge(local.final_simple_tags, local.final_complex_tags)
}

resource "azurerm_app_service_plan" "service_plan" {
  name                = var.service_plan_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  kind                = var.service_plan_kind
  reserved            = true
  tags                = merge(local.final_simple_tags, local.final_complex_tags)

  sku {
    tier = var.service_plan_sku_tier
    size = var.service_plan_sku_size
  }
}

resource "azurerm_linux_function_app" "linux_function" {
  name                = "${var.resource_group_name}-${var.function_app_name}-${random_integer.function_random.result}"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location

  storage_account_name       = azurerm_storage_account.function_sg.name
  storage_account_access_key = azurerm_storage_account.function_sg.primary_access_key
  service_plan_id            = azurerm_app_service_plan.service_plan.id

  https_only = var.function_only_https
  tags       = merge(local.final_simple_tags, local.final_complex_tags)

  site_config {
    application_stack {
      python_version = var.function_python_version
    }
  }

  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY        = azurerm_application_insights.function-app-insights.instrumentation_key
    APPLICATIONINSIGHTS_CONNECTION_STRING = azurerm_application_insights.function-app-insights.connection_string
  }



  # application_stack = {
  #   python_version = 3.9
  # }
}