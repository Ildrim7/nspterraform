env             = "prod"
subscription_id = "00000000-0000-0000-0000-000000000000"

# access_mode = "Transition"

nsp_regions = {
  weu = {
    location            = "westeurope"
    resource_group_name = "rg-nsp-prod-weu"
    storage_account_ids = []
    inbound_cidrs       = []
    outbound_cidrs      = []
  }

  uks = {
    location            = "uksouth"
    resource_group_name = "rg-nsp-prod-uks"
    storage_account_ids = []
    inbound_cidrs       = []
    outbound_cidrs      = []
  }
}

