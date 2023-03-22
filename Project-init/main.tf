# configure aws provider 
provider "aws" {
  region    = var.region
  profile   = "custom"    # your own custon profile with AWS credentials. 
}

# create vpc
# reference vpc module
module "vpc" {
source                          = "../modules/vpc"
region                          = var.region
project_name                    = var.project_name
vpc_cidr                        = var.vpc_cidr
public_subnet_az1_cidr          = var.public_subnet_az1_cidr
public_subnet_az2_cidr          = var.public_subnet_az2_cidr
private_app_subnet_az1_cidr     = var.private_app_subnet_az1_cidr
private_app_subnet_az2_cidr     = var.private_app_subnet_az2_cidr
private_data_subnet_az1_cidr    = var.private_data_subnet_az1_cidr
private_data_subnet_az2_cidr    = var.private_data_subnet_az2_cidr
}


# create security group
# reference sec froup module
module "security_group" {
  source = "../modules/security-groups"
  vpc_id = module.vpc.vpc_id

}

# create application load balancer referring module

module "application_load_balancer" {
  source                  = "../modules/alb"
  project_name            = module.vpc.project_name
  abl_security_group_id   = module.security-group.abl_security_group_id
  public_subnet_az1_id    = module.vpc.public_subnet_az1_id
  public_subnet_az2_id    = module.vpc.public_subnet_az2_id
  vpc_id                  = module.vpc.vpc_id
  certificate_arn         = module.acm.certificate_arn
}

# create certificate 

module "acm" {

source            = "../modules/acm"
domain_name       = var.domain_name
alternative_name  = var.alternative_name
  
}
