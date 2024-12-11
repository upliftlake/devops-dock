# default variable file to automatically load the values


#rg vars
variable "rg" {
 type = string
 default = "rg-rnd"
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


#kv vars
variable "kv" {
  type = string
  default = "kv-rnd"
  description = "Key Vault"
}

variable "kv_sku" {
  type = string
  default = "standard"
  description = "Key Vault"
}
