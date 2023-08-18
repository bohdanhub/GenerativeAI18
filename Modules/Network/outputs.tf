output "vpc_id" {
  value = aws_vpc.main.id
}
output "subnets_id" {
  value = [for k, v in aws_subnet.subnets : aws_subnet.subnets[k].id]
}