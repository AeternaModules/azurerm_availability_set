output "availability_sets_location" {
  description = "Map of location values across all availability_sets, keyed the same as var.availability_sets"
  value       = { for k, v in azurerm_availability_set.availability_sets : k => v.location }
}
output "availability_sets_managed" {
  description = "Map of managed values across all availability_sets, keyed the same as var.availability_sets"
  value       = { for k, v in azurerm_availability_set.availability_sets : k => v.managed }
}
output "availability_sets_name" {
  description = "Map of name values across all availability_sets, keyed the same as var.availability_sets"
  value       = { for k, v in azurerm_availability_set.availability_sets : k => v.name }
}
output "availability_sets_platform_fault_domain_count" {
  description = "Map of platform_fault_domain_count values across all availability_sets, keyed the same as var.availability_sets"
  value       = { for k, v in azurerm_availability_set.availability_sets : k => v.platform_fault_domain_count }
}
output "availability_sets_platform_update_domain_count" {
  description = "Map of platform_update_domain_count values across all availability_sets, keyed the same as var.availability_sets"
  value       = { for k, v in azurerm_availability_set.availability_sets : k => v.platform_update_domain_count }
}
output "availability_sets_proximity_placement_group_id" {
  description = "Map of proximity_placement_group_id values across all availability_sets, keyed the same as var.availability_sets"
  value       = { for k, v in azurerm_availability_set.availability_sets : k => v.proximity_placement_group_id }
}
output "availability_sets_resource_group_name" {
  description = "Map of resource_group_name values across all availability_sets, keyed the same as var.availability_sets"
  value       = { for k, v in azurerm_availability_set.availability_sets : k => v.resource_group_name }
}
output "availability_sets_tags" {
  description = "Map of tags values across all availability_sets, keyed the same as var.availability_sets"
  value       = { for k, v in azurerm_availability_set.availability_sets : k => v.tags }
}

