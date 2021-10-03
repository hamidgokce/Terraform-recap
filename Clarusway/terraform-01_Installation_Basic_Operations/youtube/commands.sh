# sudo yum install wget unzip -y
# wget https://releases.hashicorp.com/terraform/1.0.5/terraform_1.0.5_linux_amd64.zip
# ls
# unzip terraform_1.0.5_linux_amd64.zip
# ls
# rm -rf terraform_1.0.5_linux_amd64.zip 
# sudo mv terraform /bin
# terraform
# terraform --version
# mkdir terraform
# cd terraform
# git
# sudo yum install git -y
# git clone https://github.com/hamidgokce/Terraform_youtube.git
# ls
# vi user.tf
# ==> 
resource "aws_iam_user" "lb" {
  name = "loadbalancer"
  path = "/system/"

  tags = {
    tag-key = "tag-value"
  }
}


resource "aws_iam_user" "myfirstresources" {
  name = "gokce"
  path = "/system/"

  tags = {
    tag-key = "developerHamid"
  }
}

# terraform init
# terraform plan 
# terraform apply   

# vi profider.tf
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# terraform init

# vi group.tf
resource "aws_iam_group" "developers" {
  name = "developers"
  path = "/users/"
}

resource "aws_iam_group" "developers" {
  name = "developers1"
}

# terraform fmt
# terraform plan
# terraform apply -auto-approve


# vi membership.tf
AWS iam group membership terraform
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_membership

resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.user_one.name,
    aws_iam_user.user_two.name,
  ]

  group = aws_iam_group.group.name
}

resource "aws_iam_group" "group" {
  name = "test-group"
}

resource "aws_iam_user" "user_one" {
  name = "test-user"
}

resource "aws_iam_user" "user_two" {
  name = "test-user-two"
}


***********************
resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"      

  users = [
    aws_iam_user.Ayse.name,
    aws_iam_user.Ahmet.name,
  ]

  group = aws_iam_group.YeniDevelopers.name 
}

resource "aws_iam_group" "group" {
  name = "YeniDevelopers"
}

resource "aws_iam_user" "user_one" {        
  name = "Ayse"
}

resource "aws_iam_user" "user_two" {        
  name = "Ahmet"
}
















