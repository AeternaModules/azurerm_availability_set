variable "availability_sets" {
  description = <<EOT
Map of availability_sets, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - managed
    - platform_fault_domain_count
    - platform_update_domain_count
    - proximity_placement_group_id
    - tags
EOT

  type = map(object({
    location                     = string
    name                         = string
    resource_group_name          = string
    managed                      = optional(bool)
    platform_fault_domain_count  = optional(number)
    platform_update_domain_count = optional(number)
    proximity_placement_group_id = optional(string)
    tags                         = optional(map(string))
  }))
  validation {
    condition = alltrue([
      for k, v in var.availability_sets : (
        can(regex("^[a-zA-Z0-9]([-._a-zA-Z0-9]{0,78}[a-zA-Z0-9_])?$", v.name))
      )
    ])
    error_message = "The Availability set name can contain only letters, numbers, periods (.), hyphens (-),and underscores (_), up to 80 characters, and it must begin a letter or number and end with a letter, number or underscore."
  }
  validation {
    condition = alltrue([
      for k, v in var.availability_sets : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.availability_sets : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.availability_sets : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.availability_sets : (
        v.platform_update_domain_count == null || (v.platform_update_domain_count >= 1 && v.platform_update_domain_count <= 20)
      )
    ])
    error_message = "must be between 1 and 20"
  }
  validation {
    condition = alltrue([
      for k, v in var.availability_sets : (
        v.platform_fault_domain_count == null || (v.platform_fault_domain_count >= 1 && v.platform_fault_domain_count <= 3)
      )
    ])
    error_message = "must be between 1 and 3"
  }
  validation {
    condition = alltrue([
      for k, v in var.availability_sets : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 5 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

