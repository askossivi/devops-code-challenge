output "web-pub-ip" {
    description = "ID of the public eip"
    value = aws_eip.Web-eip.public_ip
}

