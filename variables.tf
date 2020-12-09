variable "environment" {
  description = "The staging environment"
}

variable "project" {
  description = "The GitLab project which hosts these resources"
}

variable "location" {
  description = "The Azure region for the resources"
}

variable "market" {
  description = "The name of the market which owns these resources"
}


variable "product" {
  description = "The product the resources belong to"
}

variable "additional_tags" {
  type        = map(string)
  description = "A map of additional tags to add to the default tags block"
  default     = {}
}
