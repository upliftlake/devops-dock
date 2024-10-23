variable "serviceplansize" {
  type    = string
  default = "dev_dv2m3o5"  # Fixed value
}

data "azurerm_resource_group" "rg-devops-rnd" {
  name = var.rg
}

resource "azurerm_service_plan" "serviceplan" {
  name                = var.azure_serviceplan
  resource_group_name = data.azurerm_resource_group.rg-devops-rnd.name
  location            = data.azurerm_resource_group.rg-devops-rnd.location
  os_type             = "Linux"
  sku_name            = var.serviceplan_size[var.serviceplansize]
}

resource "azurerm_linux_web_app" "webapp" {
  name                = var.azure_webapp
  resource_group_name = data.azurerm_resource_group.rg-devops-rnd.name
  location            = data.azurerm_resource_group.rg-devops-rnd.location
  service_plan_id     = azurerm_service_plan.serviceplan.id
  https_only          = true

  logs {
    http_logs {
      file_system {
        retention_in_days = 7
        retention_in_mb   = 100
      }
    }
  }

  app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = var.app_settings.ENABLE_APP_SERVICE_STORAGE
    #DD_API_KEY                          = local.merged_app_settings["DD_API_KEY"]
    DD_API_KEY                          = var.app_settings_secret.DD_API_KEY     
    DD_LOGS_ENABLED                     = var.app_settings.DD_LOGS_ENABLED         
    DD_LOGS_INJECTION                   = var.app_settings.DD_LOGS_INJECTION 
    DD_SITE                             = var.app_settings.DD_SITE                                
    DD_TRACE_ENABLED                    = var.app_settings.DD_TRACE_ENABLED    
    DD_TRACE_SAMPLE_RATE                = var.app_settings.DD_TRACE_SAMPLE_RATE
    DOCKER_REGISTRY_SERVER_URL          = var.app_settings.DOCKER_REGISTRY_URL
    TINI_SUBREAPER                      = var.app_settings.TINI_SUBREAPER
    PORT                                = var.app_settings.PORT
  }

  site_config {
    application_stack {
      docker_image        = var.container.image
      docker_image_tag    = var.container.tag
    }
    
    cors { 
      allowed_origins = ["*"] 
    }

    app_command_line    = var.container.start_command
    ftps_state          = "FtpsOnly"
    health_check_path   = var.container.health_check
  }

  sticky_settings {
    app_setting_names = ["DD_API_KEY", "DD_LOGS_ENABLED", "DD_LOGS_INJECTION", "DD_SITE", "DD_TRACE_ENABLED"]
  }

  tags = {
    name = "attempt-webapp-gotenberg"
    env  = "attempt"
  }
}