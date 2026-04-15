# NSP associations (Storage Accounts)

This Terraform config creates:

- a Network Security Perimeter (NSP)
- an NSP profile
- associations from the profile to **existing** Storage Accounts (by resource ID)
- inbound/outbound NSP access rules using **CIDR** `address_prefixes`

It is intended to be reused across **multiple environments** (Dev/UAT/Preprod/Prod), **subscriptions**, and **two regions** (WEU + UKS) via `*.tfvars`.

## Prereqs

- Terraform installed
- Logged into Azure (`az login`) or running in a pipeline with an Azure identity
- You know:
  - the **subscription_id** for each environment
  - the **existing resource group name** where NSP should live
  - the **storage account names** (or full resource IDs) to associate

## Quick start

Initialize once:

```bash
terraform init
```

Plan/apply for an environment (creates both WEU + UKS NSPs in one run):

```bash
terraform plan  -var-file="env/dev-uks.tfvars"
terraform apply -var-file="env/dev-uks.tfvars"
```

Replace with:

```bash
terraform plan  -var-file="env/dev.tfvars"
terraform apply -var-file="env/dev.tfvars"
```

## Environments provided (examples)

- `env/dev.tfvars`
- `env/uat.tfvars`
- `env/preprod.tfvars`
- `env/prod.tfvars`

## Notes

- **Learning mode**: `access_mode` defaults to `Transition` (learning). You can omit it from tfvars unless you want to override.
- **Storage Accounts**: this repo does **not** create them. You must supply their resource IDs.

