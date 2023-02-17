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
