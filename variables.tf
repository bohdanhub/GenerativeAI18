variable "aws_bucket_name" {}
variable "aws_region" {}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "tag_template" {
  default = "GenAi"
}
variable "private_subnet_name" {
  default = "private-subnet"
}
variable "public_subnet_name" {
  default = "public_subnet"
}
variable "private_subnet_cidrs" {
  default = "10.0.2.0/24"
}
variable "public_subnet_cidrs" {
  default = "10.0.1.0/24"
}
variable "instance_ami" {
  default = "ami-0c4c4bd6cf0c5fe52"
}
variable "instance_type" {
  default = "t2.micro"
}