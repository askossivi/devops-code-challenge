output "elb_dns_name" {
    description = "List the public dns"
    value = aws_elb.web_elb.dns_name
}
