resource "aws_vpc" "this" {
  cidr_block = var.vpc.cidr_block

  tags = merge({ Name = var.vpc.name }, var.tags)
}
