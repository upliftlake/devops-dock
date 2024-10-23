resource "azurerm_linux_web_app" "res-0" {
  app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
  }
  https_only          = true
  location            = "switzerlandnorth"
  name                = "dev-processes-gotenberg"
  resource_group_name = "rg-devops-rnd"
  service_plan_id     = "/subscriptions/6b284c13-deae-4ba4-a188-36192eb6f2ef/resourceGroups/rg-devops-rnd/providers/Microsoft.Web/serverFarms/ASP-gotenberg-9e1c"
  logs {
    http_logs {
      file_system {
        retention_in_days = 7
        retention_in_mb   = 100
      }
    }
  }
  site_config {
    ftps_state        = "FtpsOnly"
    health_check_path = "/health"
  }
  sticky_settings {
    app_setting_names = ["DD_API_KEY", "DD_LOGS_ENABLED", "DD_LOGS_INJECTION", "DD_SITE", "DD_TRACE_ENABLED", "DD_TRACE_SAMPLE_RATE", "TINI_SUBREAPER"]
  }
}
