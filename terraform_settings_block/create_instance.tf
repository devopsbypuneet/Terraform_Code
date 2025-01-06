terraform {
  required_version = ">= 0.12"
  required_providers {
    aws = "~> 5.0"
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0cda377a1b884a1bc"
  instance_type = "t2.micro"
  #name          = "my instance"
}
