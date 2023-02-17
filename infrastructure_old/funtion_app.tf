# Create a resource group
resource "azurerm_resource_group" "rs_gp" {
  name     = "sai-lab"
  location = "East US"
}

locals {
  tags_json = jsonencode(file("${path.module}/test.json"))

  tags_json1 = replace(local.tags_json, "\\", "")

#   tags_json2 = replace(local.tags_json, "rn", "")


  flattened_tags = regexall("\"([^\"]+)\"\\s:\\s(\"[^\"]+\"|[0-9]+),?", local.tags_json1)

  tag_keys = [
    for x in local.flattened_tags : x[0]
  ]

  tag_values = [
    for x in local.flattened_tags : x[1]
  ]

  final_tags = zipmap(local.tag_keys, local.tag_values)

#   tags_out = flatten(local.flattened_tags)

#   regexall("(?P<key>\"[^\"]+\"):\\s*(?P<value>(true|false|[0-9a-zA-Z+\\-,$.]*|\"[^\"]*\"))", jsonencode(local.tags_json))
}

resource "random_integer" "random" {
  min = 1
  max = 5
  keepers = {
    # Generate a new integer each time we switch to a new listener ARN
    new_storage_account = var.storage_account_creation
  }
}


resource "azurerm_storage_account" "function_sg" {
  name                     = "sailab${random_integer.random.result}"
  resource_group_name      = azurerm_resource_group.rs_gp.name
  location                 = azurerm_resource_group.rs_gp.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  enable_https_traffic_only = true

  tags = local.final_tags
}

resource "azurerm_application_insights" "function-app-insights" {  
    name = "linux-function-app-insights" 
    resource_group_name = azurerm_resource_group.rs_gp.name
    location = azurerm_resource_group.rs_gp.location
    application_type = "web"
}

resource "azurerm_app_service_plan" "example" {
  name                = "linux-function-app-service-plan"
  location            = azurerm_resource_group.rs_gp.location
  resource_group_name = azurerm_resource_group.rs_gp.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_linux_function_app" "example" {
  name                = "sai-lab-linux-function-app-${random_integer.random.result}"
  resource_group_name = azurerm_resource_group.rs_gp.name
  location            = azurerm_resource_group.rs_gp.location

  storage_account_name       = azurerm_storage_account.function_sg.name
  storage_account_access_key = azurerm_storage_account.function_sg.primary_access_key
  service_plan_id            = azurerm_app_service_plan.example.id

  https_only = true

  site_config {
    application_stack {
      python_version = 3.9
    }
  }

  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY = azurerm_application_insights.function-app-insights.instrumentation_key
    APPLICATIONINSIGHTS_CONNECTION_STRING = azurerm_application_insights.function-app-insights.connection_string
  }

  

  # application_stack = {
  #   python_version = 3.9
  # }
}