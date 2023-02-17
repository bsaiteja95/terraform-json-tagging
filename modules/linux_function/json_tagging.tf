provider "http" {}

data "http" "complex" {
  count = length(var.tags_complex_url) > 0 ? 1 : 0
  url   = var.tags_complex_url
}

data "http" "simple" {
  count = length(var.tags_simple_url) > 0 ? 1 : 0
  url   = var.tags_simple_url
}

variable "empty_list" {
  type    = list(any)
  default = []
}


locals {
  tags_simple_json = length(var.tags_simple_url) > 0 ? jsondecode(data.http.simple[0].response_body) : {}

  final_simple_tags = length(var.tags_simple_url) > 0 ? { for k, v in local.tags_simple_json : k => v } : {}



  tags_complex_json = length(var.tags_complex_url) > 0 ? jsonencode(data.http.complex[0].response_body) : ""


  complex_tags_1 = replace(local.tags_complex_json, "\\", "")


  complex_flattened_tags = regexall("([^\"]+)\"\\s*:\\s*\"([^\"]+)\",?", local.complex_tags_1)

  #   flattened_tags = regexall("\"([^\"]+)\"\\s*:\\s*(\"[^\"]+\"|[0-9]+[^A-z]),?", local.tags_json1)

  complex_tag_keys = [
    for x in local.complex_flattened_tags : x[0]
  ]

  complex_tag_values = [
    for x in local.complex_flattened_tags : x[1]
  ]

  final_complex_tags = length(var.tags_complex_url) > 0 ? zipmap(local.complex_tag_keys, local.complex_tag_values) : {}

}
