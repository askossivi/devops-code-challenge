# Create S3 bucket
resource "aws_s3_bucket" "tf_assignment" {
    bucket = "bucket-11132022"  # Choose a different bucket name for your bucket!
    tags = {
        Name        = "Assignment-bucket"
        Environment = "assignment"
    }
#     versioning {
#         enabled = true
#  }
#     server_side_encryption_configuration {
#         rule {
#             apply_server_side_encryption_by_default {
#                 kms_master_key_id = aws_kms_key.terraform-bucket-key.arn
#                 sse_algorithm     = "aws:kms"
#             }
#         }
#     }
}

# Enable Versionning
resource "aws_s3_bucket_versioning" "versioning_bucket" {
  bucket = aws_s3_bucket.tf_assignment.id
  versioning_configuration {
    status = "Enabled"
  }
}

# S3 bucket access permission
resource "aws_s3_bucket_acl" "bucket-acl" {
  bucket = aws_s3_bucket.tf_assignment.id
  acl    = "private"
}

# S3 Encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.tf_assignment.bucket

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.terraform-bucket-key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

