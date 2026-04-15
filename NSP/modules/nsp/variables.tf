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
  default     = "inbound"
}

variable "outbound_rule_name" {
  description = "Outbound access rule name"
  type        = string
  default     = "outbound"
}

variable "inbound_cidrs" {
  description = "Inbound allowed CIDR ranges"
  type        = list(string)
  default     = []
}

variable "outbound_cidrs" {
  description = "Outbound allowed CIDR ranges"
  type        = list(string)
  default     = []
}

variable "enable_databricks_serverless_inbound" {
  description = "Add AzureDatabricksServerless service tag as inbound rule"
  type        = bool
  default     = true
}

variable "inbound_service_tags" {
  description = "List of service tags for inbound access rules"
  type        = list(string)
  default     = ["AzureDatabricksServerless"]
}

variable "outbound_service_tags" {
  description = "List of service tags for outbound access rules"
  type        = list(string)
  default     = []
}