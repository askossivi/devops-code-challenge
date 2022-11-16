resource "aws_eip" "Web-eip" {
    instance = aws_instance.Web-instance.id
    tags = {
      "Name" = "Web-eip"
    }
    depends_on = [
        aws_internet_gateway.igw
        ]
    vpc = true
}