variable "s3_bucket_name" {
  description = "s3 Bucket Name"
  type = string 
  default = "flugel-infrateam-bucker-99"
}


variable "s3_bucket_acl" {
  description = "s3 Bucket Access Control List"
  type = string 
  default = "private"
}

variable "s3_block_public_acls" {
  description = "s3 Bucket Access Control List"
  type = bool 
  default = false
}
