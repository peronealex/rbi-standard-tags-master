locals {

  # Normalise values
  lowercase = {
    market       = lower(var.market)
    subscription = lower(data.azurerm_subscription.current.display_name)
    project      = lower(var.project)
    environment  = lower(var.environment)
    product      = lower(var.product)
    location     = lower(var.location)
  }

  no_spaces = {
    product  = replace(local.lowercase["product"], " ", "")
    location = replace(local.lowercase["location"], " ", "")
  }

  environment_selector = {
    prototype   = "proto"
    development = "dev"
    production  = "prod"
  }

  environment_short = lookup(local.environment_selector, local.lowercase["environment"])

  # Build tags map
  tags = {
    market       = local.lowercase["market"]
    subscription = local.lowercase["subscription"]
    project      = local.lowercase["project"]
    environment  = local.lowercase["environment"]
    product      = local.lowercase["product"]
    location     = local.lowercase["location"]
  }

  # Values to be output
  base_name = "${local.lowercase["subscription"]}-${local.environment_short}-${local.no_spaces["location"]}-${local.no_spaces["product"]}"

  default_tags = merge(
    {
      terraform = "true"
      provider  = "azure"
    },
    local.tags,
    var.additional_tags
  )
}