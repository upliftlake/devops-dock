# default variable file to automatically load the values


#rg vars
variable "rg" {
 type = string
 default = "rg-devops-rnd"
 description = "Resource Group"
}

variable "rg_location" {
 type = map
 default = {
    "swissnorth"    = "Switzerland North"
    "centralindia"  = "Central India"
 }
 description = "Resource Group Location"
}





#webapp vars
variable "azure_serviceplan" {
   type = string
   default = "attempt-asp-gotenberg"
   description = "Azure Serviceplan Name"
}

variable "serviceplan_size" {
   type = map
   default = {
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
   description = "Service Plan Size"
}

variable "azure_webapp" {
   type = string
   default = "attempt-webapp-gotenberg"
   description = "Azure Webapp Name"
}

variable "app_settings_secret" {
  type = map(any)
  description = "Secrets from the Secret vars file"
}

variable "app_settings" {
   type = map
   default = {
      PORT                        = "80"
   #   DD_API_KEY                  = ""
      DD_LOGS_ENABLED             = "true"      
      DD_LOGS_INJECTION           = "true"
      DD_SITE                     = "datadoghq.eu"                   
      DD_TRACE_ENABLED            = "true"
      DD_TRACE_SAMPLE_RATE        = "1.0"
      DOCKER_REGISTRY_URL         = "https://index.docker.io/v1"
      TINI_SUBREAPER              = "true"
      ENABLE_APP_SERVICE_STORAGE  = "false"
   }
}

variable "container" {
   type = map
   default = {
      image = "shafink/gotenberg-dd"
      #image = "gotenberg/gotenberg"
      tag = "8.1"
      start_command = "gotenberg --api-port=80 --api-timeout=1800s --log-level=info"
      health_check = "/health"
   }
   description = "Variables needed for the Container"
}





#network vars
variable "vnet" {
 type = string
 default = "deploy-vnet"
 description = "Virtual Network"
}

variable "snet" {
 type = map
 default = {
   "snet-vm" = "snet-vm"
   }
 description = "Subnet"
}

variable "pubip" {
 type = string
 default = "pubip-1"
 description = "Public IP"
}





#vm vars
variable "nsg" {
 type = string
 default = "nsg-dev-rabbitredis-123"
 description = "Network Security Group"
}

variable "nic" {
 type = string
 default = "nic-dev-rabbitredis-456"
 description = "Network Interface Card"
}

variable "ipconfig" {
 type = string
 default = "ipconfig1"
 description = "Network Interface Card"
}

variable "vm" {
 type = string
 default = "vm-dev-rabbitredis"
 description = "Virtual Machine"
}

variable "vm_size" {
 type = map
 default = {
    "v1m1"  = "Standard_B1s"
    "v1m2"  = "Standard_B1ms"
    "v2m4"  = "Standard_B2s"
    "v2m8"  = "Standard_B2ms"
    "v4m16" = "Standard_B4ms"
    "v8m32" = "Standard_B8ms" 
    }
 description = "Virtual Machine Size"
}

variable "vm_user" {
 type = string
 default = "devrabbitredis"
 description = "Virtual Machine user"
}

variable "vm_pass" {
 type = string
 default = "a;dfja;dfjal;sfdj"
 description = "Virtual Machine password"
}

variable "os_disk" {
 type = string
 default = "osdisk-dev-rabbitredis_OsDisk_1_98765432100123456789"
 description = "OS Disk"
}

variable "os_disksize" {
 type = string
 default = "30"
 description = "OS Disk Size"
}

variable "data_disk" {
 type = string
 default = "datadisk-dev-rabbitredis_DataDisk_1_98765432100123456789"
 description = "OS Disk"
}

variable "disk_type" {
 type = map
 default = {
   "StandardHDD" = "Standard_LRS"
   "StandardSSD" = "StandardSSD_LRS"
   "PremiumSSD"  = "Premium_LRS"
 }
 description = "Disk type"
}

variable "os_publisher" {
 type = map
 default = {
    "ubuntu18" = "Canonical"
    "ubuntu20" = "Canonical"
    "ubuntu22" = "Canonical"
    }
 description = "Publisher"
}

variable "os_offer" {
 type = map
 default = {
    "ubuntu18" = "UbuntuServer"
    "ubuntu20" = "0001-com-ubuntu-server-focal"
    "ubuntu22" = "0001-com-ubuntu-server-jammy"
 }
 description = "Offer"
}

variable "os_sku" {
 type = map
 default = {
    "ubuntu18" = "18.04-LTS"
    "ubuntu20" = "20_04-lts-gen2"
    "ubuntu22" = "22_04-lts-gen2"
    }
 description = "SKU"
}
