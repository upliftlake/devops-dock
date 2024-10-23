
## this is the tf for deploying multiple functions in one appserviceplan
data "azurerm_resource_group" "rg-name" {
  name = "rg"
}

data "azurerm_storage_account" "blobfunc" {
  name = "blobfunc"
  resource_group_name = data.azurerm_resource_group.rg-name.name
}

data "azurerm_service_plan" "ASP-serviceplanname-a601" {
  name                = "ASP-serviceplanname-a601"
  resource_group_name = data.azurerm_resource_group.rg-name.name
}

locals {
 function_apps = {
   "func1" = { name = "funcName1" },
   "func2" = { name = "funcName2" },
   "func3" = { name = "funcName3" },
   "func4" = { name = "funcName4" },
   "func5" = { name = "funcName5" },
   "func6" = { name = "funcName6" },
   "func7" = { name = "funcName7" }
 }
}


# use a foreach loop
resource "azurerm_windows_function_app" "envnamefunctionapps1" {
  for_each            = local.function_apps
  name                = each.value.name
  resource_group_name = data.azurerm_resource_group.rg-name.name
  location            = data.azurerm_resource_group.rg-name.location

  storage_account_name       = data.azurerm_storage_account.blobfunc.name
  storage_account_access_key = data.azurerm_storage_account.blobfunc.primary_access_key
  service_plan_id            = data.azurerm_service_plan.ASP-serviceplanname-a601.id

  tags = {
    name = "DevFunctions"
    env  = "dev"
  }

  site_config {}
}