# Terraform-Module-3-Tire-Application
![image](https://github.com/anilbd2003/Terraform-Module-3-Tire-Application/assets/57112052/f6d509e4-a379-4ee4-af35-66570198657c)


A)	Modules: 

Each Modules folder contains 3 files: main.tf, variables.tf and outputs.tf.

Main.tf file contains main templated code. Varialbes.tf contains all variables referred in main.tf file. Outputs.tf exports values which we want to refer in another module. 

B)	Project-init

This project will create following infrastructure. 

•	VPC

•	IGW, attach it to VPC

•	Public subnet AZ1

•	Public subnet AZ2

•	Public Route table (route to IGW), attach to both public subnet 

•	Private-app subnet AZ1

•	Private-app subnet AZ2

•	Private-data subnet AZ1

•	Private-data subnet AZ1

•	Private-data subnet AZ2

•	Security group- 2 

•	Alb (Application load balancer)

•	Public SSL certificate for your domain

Before you initialize the repo, you need to perform following pre-requisite. 

•	Create S3 bucket in us-east-1 region with bucket name as mentioned on backend.tf file. 

•	Create domain name in route 53. Copy domain name and paste in the field domain_name of file terraform.tfvars. make sure you adjust alternative_name accordingly. 
•	Create your own custom profile with AWS credentials. 


C)	Terraform command

•	Open terminal in project-init folder

•	Use command: terraform init

•	Use command: terraform plan

•	Use command: terraform apply   

•	Yes

•	Check in AWS management console for resource creation (VPC, Subnet, RT, SG, Alb, SSL cert.)

•	Use command: terraform destroy

•	Yes

•	Check in AWS management console for resource destruction
