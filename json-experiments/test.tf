# locals {
#   local_tags = jsonencode(file("${path.module}/test.json"))
# }

# data "external" "api_response" {
#   program = ["curl", "https://api.agify.io/?name=bella"]
# }


provider "http" {}

data "http" "example" {
  url = "https://api.agify.io?name=bella"
}

output "example_json" {
  value = jsondecode(data.http.example.response_body)
}

# locals {
#   tags_json = jsondecode(data.external.api_response.result)

# variable "test" {
#   type = list
#   default = ["a", "b", "c"]
# }


# locals {
#   tags_json = jsondecode(file("${path.module}/test.json"))

#   tags = {
#     for tag_key, tag_value in local.tags_json :
#       tag_key => try(
#         {
#           for nested_key, nested_value in tag_value : nested_key => nested_value
#         },
#         try(join(",", tag_value), tag_value)
#       )
#   }
# }

locals {
  tags_json = jsonencode(data.http.example.response_body)

  #   tags_json = jsonencode(file("${path.module}/test.json"))

  tags_json1 = replace(local.tags_json, "\\", "")

  #   tags_json2 = replace(local.tags_json, "rn", "")


  flattened_tags = regexall("([^\"]+)\"\\s*:\\s*\"([^\"]+)\",?", local.tags_json1)

  #   flattened_tags = regexall("\"([^\"]+)\"\\s*:\\s*(\"[^\"]+\"|[0-9]+[^A-z]),?", local.tags_json1)

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

# locals {
#   local_tags = ["a", "b", "c"]

#   local_type = (can(list(tag_value)) || type(tag_value) == "list") ? 1 : 0
# }

output "tags_json1" {
  value = local.tags_json1
}

output "tag_keys" {
  value = local.tag_keys
}

output "tag_values" {
  value = local.tag_values
}

output "final_tags" {
  value = local.final_tags
}

# output "tags_values" {
#     value = local.tag_values
# }

# "([^"]+)"\s*:\s*"([^"]+)",?