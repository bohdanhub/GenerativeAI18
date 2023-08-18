resource "aws_instance" "example_server" {
  count         = length(var.instance_subnets)
  ami           = var.ami
  instance_type = var.type
  subnet_id     = var.instance_subnets[count.index]
  tags = {
    Name = join("-", [var.tag, var.instance_names[count.index], "instance"])
  }
}