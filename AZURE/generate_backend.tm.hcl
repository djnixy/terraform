
# The backend configuration is the same in each stack, so we can generate it unconditionally

generate_hcl "_terramate_generated_backend.tf" {
  content {
    terraform {
      backend "local" {
        path = "terraform.tfstate"
      }
    }
  }
}
