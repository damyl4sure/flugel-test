#! /bin/bash
# Instance Identity Metadata Reference - https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-identity-documents.html

#Install Nginx 
sudo yum update -y
sudo amazon-linux-extras install nginx1 -y
sudo systemctl enable nginx.service
sudo systemctl start nginx.service
sudo echo '<h1>Welcome to Flugel-APP </h1>' | sudo tee /usr/share/nginx/html/index.html
sudo mkdir /usr/share/nginx/html/app1
sudo echo '<!DOCTYPE html> <html> <body style="background-color:rgb(250, 210, 210);"> <h1>Welcome to EC2-Flugel-APP - PATH</h1> <p>Terraform Demo</p> <p>Application Version: V1</p> </body></html>' | sudo tee /usr/share/nginx/html/app1/index.html
sudo curl http://169.254.169.254/latest/dynamic/instance-identity/document -o /usr/share/nginx/html/app1/metadata.html

#Install Apache
# sudo yum update -y
# sudo yum install -y httpd
# sudo systemctl enable httpd
# sudo service httpd start  
# sudo echo '<h1>Welcome to Flugel-APP </h1>' | sudo tee /var/www/html/index.html
# sudo mkdir /var/www/html/app1
# sudo echo '<!DOCTYPE html> <html> <body style="background-color:rgb(250, 210, 210);"> <h1>Welcome to EC2-Flugel-APP - PATH</h1> <p>Terraform Demo</p> <p>Application Version: V1</p> </body></html>' | sudo tee /var/www/html/app1/index.html
# sudo curl http://169.254.169.254/latest/dynamic/instance-identity/document -o /var/www/html/app1/metadata.html
