# access_policies.tf

# Referencing Key Vault and Managed Identity from main.tf
resource "azurerm_key_vault_access_policy" "kv-access-policy" {
  key_vault_id = azurerm_key_vault.keyvault-name.id  
  tenant_id    = data.azurerm_user_assigned_identity.managed-identity.tenant_id
  object_id    = data.azurerm_user_assigned_identity.managed-identity.principal_id

  secret_permissions = ["Get", "List", "Set", "Delete"]
#  key_permissions = ["Get", "List", "Create", "Delete", "Update"]
#  certificate_permissions = ["Get", "List", "Update", "Create", "Delete"]
}
