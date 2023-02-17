
# data "external" "api_response" {
#   program = ["curl", "https://example.com/api/tags"]
# }

# locals {
#   tags_json = jsondecode(data.external.api_response.result)

#   tags = {
#     for tag_key, tag_value in local.tags_json :
#       tag_key => ismap(tag_value) ?
#         {
#           for nested_key, nested_value in tag_value :
#             nested_key => nested_value
#         } :
#         islist(tag_value) ?
#           join(",", tag_value) :
#           tag_value
#   }
# }

# locals {
#   tags_json = jsondecode(data.external.api_response.result)

#   tags = {
#     for tag_key, tag_value in local.tags_json :
#       tag_key => can(tag_value)["length"] > 0 ?
#         join(",", tag_value) :
#         can(tag_value)["keys"] ?
#           {
#             for nested_key, nested_value in tag_value :
#               nested_key => nested_value
#           } :
#           tag_value
#   }
# }