# Define Local Values in Terraform
locals {
  name = "${var.environment}"
  #name = "${var.business_divsion}-${var.environment}"
  owner = var.business_divsion
  #name = "${local.owners}-${local.environment}"
  #environment = var.environment
  common_tags = {
    Name = local.name
    Owner = local.owner
    #environment = local.environment
  }
} 

