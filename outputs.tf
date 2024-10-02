output "mac_address" {
  value       = local.mac_address
  description = "Random MAC address"
}

output "interface_name" {
  value       = local.interface_name
  description = "Stable network interface name based on the MAC address"
}
