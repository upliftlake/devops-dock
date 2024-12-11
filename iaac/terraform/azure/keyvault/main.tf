data "azurerm_resource_group" "rg-name" {
  name = var.rg
}

data "azurerm_client_config" "current" {}

# optional if no access policies
# the managed identity required for the access policies file
data "azurerm_user_assigned_identity" "managed-identity" {
  name                = "user-assigned-managed-identity-name"
  resource_group_name = "managed-identity-rg"
}

resource "azurerm_key_vault" "keyvault-name" {
  name                        = var.kv
  location                    = data.azurerm_resource_group.rg-name.location
  resource_group_name         = data.azurerm_resource_group.rg-name.name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = var.kv_sku
  purge_protection_enabled    = false

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
      "List",
      "Update",
      "Create" 
    ]

    secret_permissions = [
      "Get",
      "Set",
      "List",
    ]

    storage_permissions = [
      "Get",
    ]

    certificate_permissions = [ 
      "Get",
      "List",
      "Update",
      "Create" 
    ]
  }

  tags = {
    name = var.kv
    env  = "dev"
  }
}