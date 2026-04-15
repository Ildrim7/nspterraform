resource "azurerm_network_security_perimeter" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
}

resource "azurerm_network_security_perimeter_profile" "this" {
  name                          = var.profile_name
  network_security_perimeter_id = azurerm_network_security_perimeter.this.id
}

resource "azurerm_network_security_perimeter_association" "storage_assoc" {
  for_each = toset(var.storage_account_ids)

  name        = "${var.association_name_prefix}-${substr(sha1(each.value), 0, 16)}"
  access_mode = var.access_mode

  network_security_perimeter_profile_id = azurerm_network_security_perimeter_profile.this.id
  resource_id                           = each.value
}

# CIDR-based inbound rule (your 38 IPs)
resource "azurerm_network_security_perimeter_access_rule" "inbound_cidr" {
  count = length(var.inbound_cidrs) > 0 ? 1 : 0

  name                                  = var.inbound_rule_name
  network_security_perimeter_profile_id = azurerm_network_security_perimeter_profile.this.id
  direction                             = "Inbound"

  address_prefixes = var.inbound_cidrs
}

# Service tag inbound rule (AzureDatabricksServerless)
resource "azurerm_network_security_perimeter_access_rule" "inbound_service_tag" {
  count = length(var.inbound_service_tags) > 0 ? 1 : 0

  name                                  = "${var.inbound_rule_name}-servicetag"
  network_security_perimeter_profile_id = azurerm_network_security_perimeter_profile.this.id
  direction                             = "Inbound"

  service_tags = var.inbound_service_tags
}

# CIDR-based outbound rule
resource "azurerm_network_security_perimeter_access_rule" "outbound_cidr" {
  count = length(var.outbound_cidrs) > 0 ? 1 : 0

  name                                  = var.outbound_rule_name
  network_security_perimeter_profile_id = azurerm_network_security_perimeter_profile.this.id
  direction                             = "Outbound"

  address_prefixes = var.outbound_cidrs
}

# Service tag outbound rule (if needed)
resource "azurerm_network_security_perimeter_access_rule" "outbound_service_tag" {
  count = length(var.outbound_service_tags) > 0 ? 1 : 0

  name                                  = "${var.outbound_rule_name}-servicetag"
  network_security_perimeter_profile_id = azurerm_network_security_perimeter_profile.this.id
  direction                             = "Outbound"

  service_tags = var.outbound_service_tags
}