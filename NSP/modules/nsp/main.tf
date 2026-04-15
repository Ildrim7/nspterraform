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

resource "azurerm_network_security_perimeter_access_rule" "inbound_databricks_serverless" {
  name                                  = var.inbound_rule_name
  network_security_perimeter_profile_id = azurerm_network_security_perimeter_profile.this.id
  direction                             = "Inbound"
  service_tags                          = ["AzureDatabricksServerless"]
}