#https://github.com/terraform-aws-modules/terraform-aws-security-group/blob/master/examples/complete/main.tf
# Create security group with module
module "Flugel_sg" {
  source = "terraform-aws-modules/security-group/aws"
  version = "4.4.0"

  name        = var.environment
  description = "Security group for ssh, http and https"
  vpc_id      = module.vpc.vpc_id
  
  ingress_cidr_blocks      = ["0.0.0.0/0"]
  ingress_rules            = ["http-80-tcp", "https-443-tcp" ]

  egress_cidr_blocks      = ["0.0.0.0/0"]
  egress_rules            = ["http-80-tcp", "https-443-tcp" ]
  
  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "ssh ports"
      cidr_blocks = "0.0.0.0/0"
    },
    # {
    #   rule        = "postgresql-tcp"
    #   cidr_blocks = "0.0.0.0/0"
    # },

  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "tcp"
      description = "All ports"
      cidr_blocks = "0.0.0.0/0"
    },

  ]
}