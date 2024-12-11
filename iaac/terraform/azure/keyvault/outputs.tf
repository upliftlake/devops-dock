output "key_id" {
  value = azurerm_key_vault_key.example_key.id
}

#output "cert_id" {
#  value = azurerm_key_vault_certificate.example_cert.id
#}

output "secret_id" {
  value = azurerm_key_vault_secret.example_secret.id
}
