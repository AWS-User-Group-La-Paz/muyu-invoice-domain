variable "tenants" {
  type = map(set(string))

  validation {
    condition = alltrue([
      for name, name_servers in var.tenants :
      can(regex("^[a-z0-9]([a-z0-9-]{0,61}[a-z0-9])?$", name)) &&
      length(name_servers) >= 2
    ])
    error_message = "Tenant names must be valid single DNS labels and include at least two nameservers."
  }
}
