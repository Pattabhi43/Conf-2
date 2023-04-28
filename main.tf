terraform {
  required_providers {
    tfe = {
      version = "~> 0.44.0"
      organization = "AWS_prk"
    }
  }
}

variable "AWS_ACCESS_KEY" {
  description = "aws access key"
}

variable "AWS_SECRET_KEY_ID" {
  description = "aws secret key"
}

variable "API-token" {
  description = "api token tf cloud"
}

provider "tfe" {
  token = var.API-token
}

provider "aws" {
  region = "ap-south-1"
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY_ID
}

data "aws_ami" "ai-2" {
  owners = ["137112412989"]
  most_recent = true
}

resource "aws_instance" "ec2-2" {
  instance_type = "t2.micro"
  ami = data.aws_ami.ai-2.id
  tags = {
    Name = "slaves"
  }
}