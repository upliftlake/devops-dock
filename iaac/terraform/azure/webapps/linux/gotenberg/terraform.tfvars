# contains the actual values that will overwrite the values of variables.tf


# azure rg
rg = "rg-devops-rnd"



# azure webapp
azure_serviceplan = "attempt-asp-gotenberg"


azure_webapp = "attempt-webapp-gotenberg"

app_settings = {
    PORT                        = "80"
    DD_LOGS_ENABLED             = "true"      
    DD_LOGS_INJECTION           = "true"
    DD_SITE                     = "datadoghq.eu"                   
    DD_TRACE_ENABLED            = "true"
    DD_TRACE_SAMPLE_RATE        = "1.0"
    DOCKER_REGISTRY_URL         = "https://index.docker.io/v1"
    TINI_SUBREAPER              = "true"
    ENABLE_APP_SERVICE_STORAGE  = "false"
}

serviceplan_size = {
     "dev_dv0m1"     = "F1"
     "dev_dv1m1o75"  = "B1"
     "dev_dv2m3o5"   = "B2"
     "dev_dv4m7"     = "B3"
     "std_sv1m1o75"  = "S1"
     "std_sv2m3o5"   = "S2"
     "std_sv4m7"     = "S3"
     "prod_pv1m4"    = "P0v3"
     "prod_pv2m8"    = "P1v3"
     "prod_pv2m16"   = "P1mv3"
     "prod_pv4m16"   = "P2v3"
     "prod_pv8m32"   = "P3v3"
     "prod_pv4m32"   = "P2mv3"
     "prod_pv8m64"   = "P3mv3"
     "prod_pv16m128" = "P4mv3"
     "prod_pv32m256" = "P5mv3"
}

serviceplansize = "dev_dv2m3o5"

container = {
    image           = "shafink/gotenberg-dd"
    tag             = "8.1"
    start_command   = "gotenberg --api-port=80 --api-timeout=1800s --log-level=info"
    health_check    = "/health"
}

