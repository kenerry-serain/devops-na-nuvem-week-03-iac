output "vpc_arn" {
  value = aws_vpc.this.arn
}

output "private_subnets_arn" {
  value = aws_subnet.privates[*].arn
}

output "public_subnets_arn" {
  value = aws_subnet.publics[*].arn
}

output "internet_gateway_arn" {
  value = aws_internet_gateway.this.arn
}
