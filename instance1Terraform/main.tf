# Configure the AWS Provider
provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAXN5XSS2XUXTUYB4M"
  secret_key = "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"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "instance_ec2_1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform EC2-1"
  }
}