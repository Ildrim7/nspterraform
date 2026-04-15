variable "env" {
  description = "Environment name (dev/sit/uat/prod)"
  type        = string
}

variable "subscription_id" {
  description = "Azure subscription ID for the deployment (environment-specific)"
  type        = string
}

variable "nsp_regions" {
  description = "Per-region NSP configuration (e.g. weu/uks)."
  type = map(object({
    location            = string
    resource_group_name = string
    storage_account_ids   = optional(list(string), [])
    storage_account_names = optional(list(string), [])
    inbound_cidrs       = optional(list(string), [])
    outbound_cidrs      = optional(list(string), [])
  }))
}

variable "access_mode" {
  description = "NSP access mode: Transition or Enforced"
  type        = string
  default     = "Learning"

validation {
    condition     = contains(["Learning", "Audit", "Enforced"], var.access_mode)
    error_message = "access_mode must be one of: Learning, Audit, Enforced."
  }
}

variable "inbound_service_tags" {
  description = "Service tags for NSP inbound rules per region"
  type        = list(string)
  default     = ["AzureDatabricksServerless"]
}

variable "outbound_service_tags" {
  description = "Service tags for NSP outbound rules per region"
  type        = list(string)
  default     = []
}