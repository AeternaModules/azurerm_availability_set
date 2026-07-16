output "availability_sets_id" {
  description = "Map of id values across all availability_sets, keyed the same as var.availability_sets"
  value       = { for k, v in azurerm_availability_set.availability_sets : k => v.id if v.id != null && length(v.id) > 0 }
}
output "availability_sets_location" {
  description = "Map of location values across all availability_sets, keyed the same as var.availability_sets"
  value       = { for k, v in azurerm_availability_set.availability_sets : k => v.location if v.location != null && length(v.location) > 0 }
}
output "availability_sets_managed" {
  description = "Map of managed values across all availability_sets, keyed the same as var.availability_sets"
  value       = { for k, v in azurerm_availability_set.availability_sets : k => v.managed if v.managed != null }
}
output "availability_sets_name" {
  description = "Map of name values across all availability_sets, keyed the same as var.availability_sets"
  value       = { for k, v in azurerm_availability_set.availability_sets : k => v.name if v.name != null && length(v.name) > 0 }
}
output "availability_sets_platform_fault_domain_count" {
  description = "Map of platform_fault_domain_count values across all availability_sets, keyed the same as var.availability_sets"
  value       = { for k, v in azurerm_availability_set.availability_sets : k => v.platform_fault_domain_count if v.platform_fault_domain_count != null }
}
output "availability_sets_platform_update_domain_count" {
  description = "Map of platform_update_domain_count values across all availability_sets, keyed the same as var.availability_sets"
  value       = { for k, v in azurerm_availability_set.availability_sets : k => v.platform_update_domain_count if v.platform_update_domain_count != null }
}
output "availability_sets_proximity_placement_group_id" {
  description = "Map of proximity_placement_group_id values across all availability_sets, keyed the same as var.availability_sets"
  value       = { for k, v in azurerm_availability_set.availability_sets : k => v.proximity_placement_group_id if v.proximity_placement_group_id != null && length(v.proximity_placement_group_id) > 0 }
}
output "availability_sets_resource_group_name" {
  description = "Map of resource_group_name values across all availability_sets, keyed the same as var.availability_sets"
  value       = { for k, v in azurerm_availability_set.availability_sets : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "availability_sets_tags" {
  description = "Map of tags values across all availability_sets, keyed the same as var.availability_sets"
  value       = { for k, v in azurerm_availability_set.availability_sets : k => v.tags if v.tags != null && length(v.tags) > 0 }
}

