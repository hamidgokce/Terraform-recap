provider "aws" {
    region = "us-east-1"
}
resource "aws_vpc" "module_vpc" {
    cidr_block = 
    tags = {
      "key" = "value"
    }
  
}

resource "aws_subnet" "public_subnet" {
    cidr_block = 
    vpc_id =  
    tags = 
  
}


resource "aws_subnet" "private_subnet" {
    cidr_block = 
    vpc_id =  
    tags = 
  
}