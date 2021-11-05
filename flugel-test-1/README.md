#Guildines to deploy the infrastructure with the Terraform files

#Installation Requirements:
- Terraform
- AWS CLI

# Configuration Requirements 
- Configure AWS credentials

# Actions to apply the TerraT
cd to the 'flugel-test-1' WORKDIR

RUN terraform init


RUN terraform validate

RUN terraform plan

RUN terraform apply -auto-approve

# CleanUp

RUN terraform destroy -auto-approve

sudo rm -rf .terraform*
sudo rm -rf terraform.tfstate*