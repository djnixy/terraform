generate_hcl "_terramate_generated_variables.tf" {
  content {

variable "product_name" {
  # description = ""
  type        = string
  default = ""
}

variable "environment" {
  # description = ""
  type        = string
  default = "development"
}

variable "region" {
  # description = ""
  type        = string
  default = ""
}


variable "azs" {
  type        = string
  default = ""
}

variable "service_name" {
  # description = ""
  type        = string
  default = ""
}


variable "sqlAdminName" {
  # description = ""
  type        = string
  default = "sqladmin"
}

variable "sqlAdminPassword" {
  # description = ""
  type        = string
  default = "NOTsoSecurePassword893!"
}

variable "databaseName" {
  # description = ""
  type        = string
  default = "api"
}

locals {
  # Common tags to be assigned to all resources
  # common_tags = {
  #   Service = local.service_name
  #   Owner   = local.owner
  # }
    http_setting_name =  join("-", ["behtst", var.product_name, var.environment])
    listener_name = join("-", ["httplstn", var.product_name, var.environment])
    request_routing_rule_name = join("-", ["rqrt", var.product_name, var.environment])
    frontend_port_name = join("-", ["feport", var.product_name, var.environment])
    frontend_ip_configuration_name = join("-", ["feip", var.product_name, var.environment])
    backend_address_pool_name = join("-", ["beap", var.product_name, var.environment])
    public_ip_address_name = join("-", ["pip", var.product_name, var.environment])
    rg_name          = join("-", ["rg", var.product_name, var.environment])
    waf_policy_name = join("-", ["waf", var.product_name, var.environment])
    app_gateway_name  = join("-", ["agw", var.product_name, var.environment])
    vnetName        = join("-", ["vnet", var.product_name, var.environment])
    planName        = join("-", ["plan", var.product_name, var.environment])
    appName         = join("-", ["app", var.product_name, var.service_name, var.environment])

    sqlServerName   = join("-", ["mysql", var.product_name, var.environment]) 
    # sqlPoolName     = join("-", ["pool", var.product_name, var.environment])
    # sqlDBName       = join("-", ["sqldb", var.databaseName , var.environment])
    # sqlDBName1      = join("-", ["sqldb", var.databaseName1 , var.environment])
}




  }
}
