env             = "dev"
subscription_id = "f9909b4a-a62c-47d4-a0f0-1b5427ca0ea2"
access_mode     = "Learning"

# AzureDatabricksServerless service tag handles serverless subnet replacement
inbound_service_tags = ["AzureDatabricksServerless"]

nsp_regions = {
  weu = {
    location            = "westeurope"
    resource_group_name = "databricks-rg-rg-redact-dev-weu-001"
    storage_account_names = [
      "dbstredactgc",
    ]
    inbound_cidrs  = []
      # Paste your 38 IPs here after running:
      # az storage account show --name dbstredactgc --resource-group databricks-rg-rg-redact-dev-weu-001 --query "networkRuleSet.ipRules[].iPAddressOrRange" -o json
    
    outbound_cidrs = []
  }
}

# This is for UK south 
#  uks = {
#    location            = "uksouth"
#    resource_group_name = "databricks-rg-rg-redact-dev-uks-001"
#    storage_account_names = [
#      "dbstredact5x4",
#    ]
#    inbound_cidrs  = [
#      # Same for UKS storage account IPs
#    ]
#    outbound_cidrs = []
#  }
#}
#