terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = " > 3.0"
    }
  }

    # S3 Backend  Replace this section with your state backend you have created
  backend "s3" {
    encrypt = true    
    bucket = "bucket-11162022"
    dynamodb_table = "terraform-state-lock"
    key    = "state/terraform.tfstate"
    region = "us-east-2"
    kms_key_id     = "alias/terraform-bucket-key"
  }
}
