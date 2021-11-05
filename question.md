#Flugel Assessemnt

TEST #1



Create Terraform code to create an S3 bucket and an EC2 instance. Both resources must be tagged with Name=Flugel, Owner=InfraTeam.
Using Terratest, create the test automation for the Terraform code, validating that both resources are tagged properly.
Setup Github Actions to run a pipeline to validate this code.
Publish your code in a public GitHub repository, and share a Pull Request with your code. Do not merge into master until the PR is approved.
Include documentation describing the steps to run and test the automation.


TEST #2



Complete the test #1 + the following actions:





Merge any pending PR.
Create a new PR with code and updated documentation for the new requirement.
I want a cluster of 2 EC2 instances behind an ALB running Nginx, serving a static file. This static file must be generated at boot, using a Python script. Put the AWS instance tags in the file.
The cluster must be deployed in a new VPC. This VPC must have only one public subnet. Do not use default VPC
Update the tests to validate the infrastructure. The test must check that files are reachable in the ALB.