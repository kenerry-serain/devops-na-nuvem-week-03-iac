resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.this.id
  subnet_id     = element(aws_subnet.publics, 0).id

  tags = merge({ Name = var.vpc.nat_gateway_name }, var.tags)

  depends_on = [aws_internet_gateway.this]
}
