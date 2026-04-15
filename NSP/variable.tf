variable "env" {
  description = "Environment name (dev/uat/preprod/prod)"
  type        = string
}

variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
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

variable "nsp_regions" {
  description = "Per-region NSP configuration"
  type = map(object({
    location              = string
    resource_group_name   = string
    storage_account_ids   = optional(list(string), [])
    storage_account_names = optional(list(string), [])
  }))
}