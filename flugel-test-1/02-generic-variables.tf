# Provisioning region
variable "aws_region" {
  description = "Region in which AWS resources would be created"
  type = string
  default = "us-east-2"
}

variable "aws_profile" {
  description = "AWS configure profile accesskey & secret ID "
  type = string
  default = "default"
  
}

# Environment Variable
variable "environment" {
  description = "Environment Variable used as a prefix"
  type = string
  default = "Flugel"
}
# Business Division
variable "business_divsion" {
  description = "Business Division in the large organization this Infrastructure belongs"
  type = string
  default = "InfraTeam"
}

variable "name" {
  description = "Resources name"
  type = string
  default = "Standard" 
}