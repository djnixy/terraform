generate_hcl "_terramate_generated_variables.tf" {
  content {

variable "product_name" {
  # description = ""
  type        = string
  default = ""
}

variable "service_name" {
  # description = ""
  type        = string
  default = ""
}

variable "environment" {
  # description = ""
  type        = string
  default = "development"
}

variable "deploy_region" {
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
}




  }
}
