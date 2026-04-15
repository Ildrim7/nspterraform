output "nsp" {
  description = "NSP outputs keyed by region (e.g. weu/uks)."
  value = {
    for k, m in module.nsp : k => {
      nsp_id     = m.nsp_id
      nsp_name   = m.nsp_name
      profile_id = m.profile_id
    }
  }
}