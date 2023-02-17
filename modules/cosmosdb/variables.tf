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

# generic tags variable

variable "tags_complex_url" {
  type    = string
  default = ""
}

variable "tags_simple_url" {
  type    = string
  default = ""
}