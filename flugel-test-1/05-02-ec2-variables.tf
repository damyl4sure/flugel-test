#Input  variables
# AWS region
# variable "aws_region" {
#   description = "Region in which AWS resources would be created"
#   type = string
#   default = "us-east-2"
# }

# AWS EC2 instance type
variable "instance_type" {
  description = "EC2 instance type"
  type = string
  default = "t2.micro"
  
}
# AWS EC2 instance key pair
variable "instance_keypair" {
  description = "AWS EC2 key pair that needs to be associated with the created instance"
  type = string
  default = "terraform-key"

}

# Aws EC2 Instance Type - List
variable "instance_type_list" {
  description = "Ec2 Instace type"
  type = list(string)
  default = [ "t3.small", "t2.micro", "t3.large" ]
}

#AWS EC2 Instance Type - Map
variable "instance_type_map" {
  description = "Ec2 Instance type"
  type = map(string)
  default = {
    "dev" = "t2.micro"
    "uat" = "t3.small"
    "prod" = "t3.large"
  }  
}
# Ec2 and S3 bucket Tag variables 
# variable "name" {
#   description = "Resources name tag"
#   type = string
#   default = "Flugel"  
# }
# variable "owner" {
#   description = "Resources owner tag"
#   type = string
#   default = "InfraTeam"
  
# }



