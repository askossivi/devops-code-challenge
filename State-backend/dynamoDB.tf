resource "aws_dynamodb_table" "state-lock-table" {
  name = "terraform-state-lock"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
        Name        = "Assignment-bucket"
        Environment = "assignment"
    }
}