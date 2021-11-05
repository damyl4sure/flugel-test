# https://registry.terraform.io/modules/terraform-aws-modules/s3-bucket/aws/latest
module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  version = "2.10.0"

  bucket = var.s3_bucket_name
  acl    = var.s3_bucket_acl
  block_public_acls = var.s3_block_public_acls

  versioning = {
    enabled = true
  }

  tags = {
    Name = "${var.environment}"
    Owner = "${var.business_divsion}"
  }
}