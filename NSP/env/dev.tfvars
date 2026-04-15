env             = "dev"
subscription_id = "f9909b4a-a62c-47d4-a0f0-1b5427ca0ea2"
access_mode     = "Learning"

nsp_regions = {
  weu = {
    location            = "westeurope"
    resource_group_name = "databricks-rg-rg-redact-dev-weu-001"
    storage_account_names = ["dbstredactgc"]
  }
}
#  uks = {
#    location            = "uksouth"
#    resource_group_name = "databricks-rg-rg-redact-dev-uks-001"
#    storage_account_names = ["dbstredact5x4"]
#  }
# }