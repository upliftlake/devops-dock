provider "azurerm" {
  features {
  }
  use_oidc                   = false
  skip_provider_registration = true
  subscription_id            = "6b284c13-deae-4ba4-a188-36192eb6f2ef"
  environment                = "public"
  use_msi                    = false
  use_cli                    = true
}
