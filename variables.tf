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
    managed                      = optional(bool, true)
    platform_fault_domain_count  = optional(number, 3)
    platform_update_domain_count = optional(number, 5)
    proximity_placement_group_id = optional(string)
    tags                         = optional(map(string))
  }))
}

