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
  # --- Unconfirmed validation candidates, derived from azurerm_availability_set's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   condition: can(regex("^[a-zA-Z0-9]([-._a-zA-Z0-9]{0,78}[a-zA-Z0-9_])?$", value))
  #   message:   The Availability set name can contain only letters, numbers, periods (.), hyphens (-),and underscores (_), up to 80 characters, and it must begin a letter or number and end with a letter, number or underscore.
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: platform_update_domain_count
  #   condition: value >= 1 && value <= 20
  #   message:   must be between 1 and 20
  # path: platform_fault_domain_count
  #   condition: value >= 1 && value <= 3
  #   message:   must be between 1 and 3
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

