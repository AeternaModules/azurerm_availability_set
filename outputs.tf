output "availability_sets" {
  description = "All availability_set resources"
  value       = azurerm_availability_set.availability_sets
}
output "availability_sets_location" {
  description = "List of location values across all availability_sets"
  value       = [for k, v in azurerm_availability_set.availability_sets : v.location]
}
output "availability_sets_managed" {
  description = "List of managed values across all availability_sets"
  value       = [for k, v in azurerm_availability_set.availability_sets : v.managed]
}
output "availability_sets_name" {
  description = "List of name values across all availability_sets"
  value       = [for k, v in azurerm_availability_set.availability_sets : v.name]
}
output "availability_sets_platform_fault_domain_count" {
  description = "List of platform_fault_domain_count values across all availability_sets"
  value       = [for k, v in azurerm_availability_set.availability_sets : v.platform_fault_domain_count]
}
output "availability_sets_platform_update_domain_count" {
  description = "List of platform_update_domain_count values across all availability_sets"
  value       = [for k, v in azurerm_availability_set.availability_sets : v.platform_update_domain_count]
}
output "availability_sets_proximity_placement_group_id" {
  description = "List of proximity_placement_group_id values across all availability_sets"
  value       = [for k, v in azurerm_availability_set.availability_sets : v.proximity_placement_group_id]
}
output "availability_sets_resource_group_name" {
  description = "List of resource_group_name values across all availability_sets"
  value       = [for k, v in azurerm_availability_set.availability_sets : v.resource_group_name]
}
output "availability_sets_tags" {
  description = "List of tags values across all availability_sets"
  value       = [for k, v in azurerm_availability_set.availability_sets : v.tags]
}

