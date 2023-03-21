# store the terraform state file in s3
terraform {
  backend "s3" {
    bucket    = "anil-web--terraform-remote-state"   #write your bucket name
    key       = "anil-web-tfstate"
    region    = "us-east-1"
    
  }
}