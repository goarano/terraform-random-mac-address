output "mac_address" {
  value       = terraform_data.mac_address.output
  description = "Random MAC address"
}

output "interface_name" {
  value       = terraform_data.interface_name.output
  description = "Stable network interface name based on the MAC address"
}
