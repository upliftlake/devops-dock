data "azurerm_resource_group" "rg-name" {
  name = "rg-name"
}

data "azurerm_storage_account" "blobfunctions" {
  name = "blobfunctions"
  resource_group_name = data.azurerm_resource_group.rg-name.name
}

resource "azurerm_service_plan" "ASP-serviceplanname-a201" {
  name                = "ASP-serviceplanname-a201"
  resource_group_name = data.azurerm_resource_group.rg-name.name
  location            = data.azurerm_resource_group.rg-name.location
  os_type             = "Windows"
  sku_name            = "Y1"
}

resource "azurerm_windows_function_app" "functionappname" {
  name                = "functionappname"
  resource_group_name = data.azurerm_resource_group.rg-name.name
  location            = data.azurerm_resource_group.rg-name.location

  storage_account_name       = data.azurerm_storage_account.blobfunctions.name
  storage_account_access_key = data.azurerm_storage_account.blobfunctions.primary_access_key
  service_plan_id            = azurerm_service_plan.ASP-serviceplanname-a201.id

  tags = {
    name = "functionappname"
    env  = "dev"
  }

  site_config {}
}