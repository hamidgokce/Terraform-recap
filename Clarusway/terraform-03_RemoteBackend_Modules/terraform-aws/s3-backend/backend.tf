provider "aws" {
    region = "us-east-1"  
}

resource "aws_s3_bucket" "tf-remote-state" {
  bucket = "tf-remote-s3-hamid"
  force_destroy = true  # normalde true olmasi gerekir ki destroy komutu ile silinmesin
    versioning {
      enabled = true
    }
    server_side_encryption_configuration {
    rule {
        apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
            }
        }

    }
}
# kriptolama icin ve documantasyonda bulunabilir

resource "aws_dynamodb_table" "tf-remote-stack-lock" {
   hash_key = "LockID"
  name = "tf-s3-app-lock"
  attribute {
    name = "LockID"
    type = "S"
  }
billing_mode = "PAY_PER_REQUEST"
}
