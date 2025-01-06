provider "aws" {
  region = "ap-south-1"
}

resource "aws_key_pair" "test" {
  key_name   = "test"
  public_key = file("${path.module}/test.pub")
}

resource "aws_instance" "stagging" {
  ami           = "ami-0fd05997b4dff7aac"
  instance_type = var.env == "dev" ? lookup(var.type, var.env, "please provide right key") : "t2.nano"
  key_name      = aws_key_pair.test.key_name
  count         = 2
  tags = {
    Name = element(var.tags, count.index)
    env  = var.env
  }
}
locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}
output "timestamp" {
  value = local.time
}
