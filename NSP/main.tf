locals {
  nsp_regions = var.nsp_regions
}

module "nsp" {
  for_each = local.nsp_regions

  source = "./modules/nsp"

  name                     = "nsp-${var.env}-${each.key}"
  profile_name             = "profile-${var.env}-${each.key}"
  location                 = each.value.location
  resource_group_name      = each.value.resource_group_name
  storage_account_ids      = concat(
    try(each.value.storage_account_ids, []),
    [
      for n in try(each.value.storage_account_names, []) :
      "/subscriptions/${var.subscription_id}/resourceGroups/${each.value.resource_group_name}/providers/Microsoft.Storage/storageAccounts/${n}"
    ]
  )
  inbound_cidrs            = each.value.inbound_cidrs
  outbound_cidrs           = each.value.outbound_cidrs
  inbound_service_tags     = var.inbound_service_tags
  outbound_service_tags    = var.outbound_service_tags
  access_mode              = var.access_mode
  association_name_prefix  = "assoc-${var.env}-${each.key}"
  inbound_rule_name        = "inbound-${var.env}-${each.key}"
  outbound_rule_name       = "outbound-${var.env}-${each.key}"
}