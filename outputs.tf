output "base_name" {
  value = local.base_name
}

output "default_tags" {
  value = local.default_tags
}

output "market" {
  value = local.lowercase["market"]
}

output "subscription" {
  value = local.lowercase["subscription"]
}

output "project" {
  value = local.lowercase["project"]
}

output "environment" {
  value = local.lowercase["environment"]
}

output "environment_short" {
  value = local.environment_short
}

output "product" {
  value = local.lowercase["product"]
}

output "location" {
  value = local.lowercase["location"]
}
