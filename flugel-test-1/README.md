#Guildines to run the TerraTest to check the tag

#Installation Requirements:
- Terraform
- Go
- AWS CLI

# Configuration Requirements 
- Configure AWS credentials
- 

# Actions to perform the TerraTest
cd to the test WORKDIR

RUN cd .. && sudo go mod init pwd
RUN cd test && sudo go mod tidy
RUN sudo go test -v ./ec2-tags-test.go

# CleanUp
sudo rm -rf ../.terraform*
sudo rm -rf ../terraform.tfstate*