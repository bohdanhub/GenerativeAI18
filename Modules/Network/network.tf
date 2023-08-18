resource "aws_vpc" "main" {
  cidr_block = var.vpc_ip

  tags = {
    Name = join("-", [var.tag, "vpc"])
  }
}

resource "aws_subnet" "subnets" {
  for_each   = { "${var.private_name}" = var.private_subnet_cidrs, "${var.public_name}" = var.public_subnet_cidrs }
  vpc_id     = aws_vpc.main.id
  cidr_block = each.value

  tags = {
    Name = join("-", [var.tag, each.key])
  }
}