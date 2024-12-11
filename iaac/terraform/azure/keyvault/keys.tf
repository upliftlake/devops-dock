resource "azurerm_key_vault_key" "example_key" {
  name         = "myKey"
  key_vault_id = azurerm_key_vault.keyvault-name.id
  key_type     = "RSA"
  key_size     = 2048
  key_opts     = [
    "decrypt", 
    "encrypt", 
    "sign", 
    "unwrapKey", 
    "verify", 
    "wrapKey"
    ]
}
