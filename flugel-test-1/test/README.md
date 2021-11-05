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

- # Command to run the ec2-instance Tagtest:
    
   RUN sudo go test -v ./ec2_tag_test.go

-  # Command to run the s3-Bucket Tagtest:

   RUN sudo go test -v ./s3_tag_test.go

# CleanUp
sudo rm -rf ../.terraform*
sudo rm -rf ../terraform.tfstate*