# Basic variables for this project

variable "resource_group_name" {
  type = string
  # default = "sai-lab-1"
}

variable "resource_group_location" {
  type = string
  # default = "East US"
}

# variables to generate random integer to append to resource names to make them unique

variable "min_random_int" {
  type    = number
  default = 1
}

variable "max_random_int" {
  type    = number
  default = 10
}

variable "create_new_infra" {
  type        = number
  description = "chaning this number will create new storage account, cosmosdb and rediscache. appending random number at the end of names of these resources"
  default     = 1
}

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

# generic tags variable in place

variable "tags_complex_url" {
  type    = string
  default = ""
}

variable "tags_simple_url" {
  type    = string
  default = ""
}