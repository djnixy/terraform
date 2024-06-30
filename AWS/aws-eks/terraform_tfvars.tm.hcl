generate_hcl "_terramate_generated_terraform.auto.tfvars" {
  content {
    
deployRegion = "ap-southeast-1"
vpc_cidr="10.99.0.0/16"
azs="test"
environment="development"
  }
}