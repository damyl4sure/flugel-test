#Resources: create EC2 Instance
resource "aws_instance" "Flugel" {
  ami           = data.aws_ami.amazon-linux2.id
  #instance_type = var.instance_type
  #instance_type = var.instance_type_list[1]  #For List variable
  instance_type = var.instance_type_map["dev"] # For Map variable
  user_data = file("${path.module}/input-Ec2-app.sh") #Terraform file function
  key_name = var.instance_keypair
  
  # Reference the created security group from the module output  
  vpc_security_group_ids = [module.Flugel_sg.security_group_id]
  
  # Create EC2 in the custom private subnet
  subnet_id = module.vpc.public_subnets[0] 

  # Associate pubic IP address to EC2 instance
  associate_public_ip_address = true
  

  #count = 1
  tags = {
    #Name = "Flugel-${count.index}"
    # Name = "Flugel"
    # OWner = local.common_tags
    Name = "${var.environment}"
    Owner = "${var.business_divsion}"

  }

}