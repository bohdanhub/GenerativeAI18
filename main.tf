terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.18.0"
    }
  }

  backend "s3" {
    bucket  = var.aws_bucket_name
    key     = "state/terraform.tfstate"
    region  = var.aws_region
    encrypt = true
  }
}

provider "aws" {
  region = var.aws_region
}

module "net" {
  source               = "./Modules/Network"
  vpc_ip               = var.vpc_cidr
  private_name         = var.private_subnet_name
  private_subnet_cidrs = var.private_subnet_cidrs
  public_name          = var.public_subnet_name
  public_subnet_cidrs  = var.public_subnet_cidrs
  tag                  = var.tag_template

}

module "instance" {
  source           = "./Modules/Instance"
  ami              = var.instance_ami
  type             = var.instance_type
  instance_subnets = module.net.subnets_id
  instance_names   = ["private", "public"]
  tag              = var.tag_template
}