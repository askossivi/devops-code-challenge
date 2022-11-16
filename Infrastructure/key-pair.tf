#resource blocks
resource "aws_key_pair" "my-aws_key_pair" {
  key_name   = var.key_name
  public_key = file(var.public_key)
  tags = {
    "Name" = "assignment-key"
  }
}