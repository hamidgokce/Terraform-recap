terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.61.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
  # profile = eger bir kac tane profil varsa ayrinti yazilabilir 
}

data "aws_ami" "built_by_terraform"{
  most_recent = true
  owners = ["self"]

  filter {
  name = "virtualization-type"
  values = ["hvm"]
  }
}






locals {
  instance-name = "hamid-local-name"
}

resource "aws_instance" "built_by_terraform" {
  ami           = data.aws_ami.built_by_terraform.id 
  instance_type = var.ec2-type
  key_name      = "EC2_key"
  tags = {
    "Name" = "${local.instance-name}-come from locals"
  }
}
resource "aws_s3_bucket" "s3_created_by_terraform" {
  # bucket = "${var.s3-bucket-name}-${count.index + 1}"
  acl = "private"
  # count = var.number_of_buckets
  #count = var.number_of_buckets != 2 ? var.number_of_buckets : 1
  for_each = toset(var.users)
  bucket   = "example-s3-bucket-${each.value}"
}

resource "aws_iam_user" "new-users" {
  for_each = toset(var.users)
  name     = each.value
}

output "built_by_terraform_public_ip" {
  value = aws_instance.built_by_terraform.public_ip
}

#output "s3_created_by_terraform-s3_metadata" {
# value = aws_s3_bucket.s3_created_by_terraform.region
#}

output "private_ip_built_by_terraform" {
  value = aws_instance.built_by_terraform.private_ip
}

#output "s3_created_by_terraform-s3metada" {
# value = aws_s3_bucket.s3_created_by_terraform[*] # tum attribute leri degil de onem arzedenleri getirmektedir * sayesinde
#}

output "uppercase_users" {
  value = [for user in var.users : upper(user) if length(user) > 6]
}