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

variable "deploy_region" {
  # description = ""
  type        = string
  default = ""
}

variable "service_name" {
  # description = ""
  type        = string
  default = ""
}

variable "vpc_cidr" {
  type        = string
  default = ""
}

variable "azs" {
  type        = string
  default = ""
}


variable "database_admin_name" {
  # description = ""
  type        = string
  default = "sqladmin"
}

variable "database_admin_password" {
  # description = ""
  type        = string
  default = "NOTsoSecurePassword893!"
}

variable "database_name" {
  # description = ""
  type        = string
  default = "api"
}

locals {

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
