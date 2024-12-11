resource "azurerm_key_vault_secret" "example_secret" {
  name         = "mySecret"
  value        = "super_secret_value"
  key_vault_id = azurerm_key_vault.keyvault-name.id
}