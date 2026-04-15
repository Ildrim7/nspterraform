variable "name" {
  description = "NSP name"
  type        = string
}

variable "profile_name" {
  description = "NSP profile name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Existing resource group name"
  type        = string
}

variable "storage_account_ids" {
  description = "Storage account resource IDs to associate"
  type        = list(string)
  default     = []
}

variable "access_mode" {
  description = "NSP access mode: Learning, Audit or Enforced"
  type        = string
  default     = "Learning"

  validation {
    condition     = contains(["Learning", "Audit", "Enforced"], var.access_mode)
    error_message = "access_mode must be one of: Learning, Audit, Enforced."
  }
}

variable "association_name_prefix" {
  description = "Prefix used to name associations"
  type        = string
  default     = "assoc"
}

variable "inbound_rule_name" {
  description = "Inbound access rule name"
  type        = string
  default     = "inbound-databricks-serverless"
}