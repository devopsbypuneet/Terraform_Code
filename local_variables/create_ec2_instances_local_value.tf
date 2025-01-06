provider "aws" {

  region = "ap-south-1"

}

locals {
  common_tags = {
    CostGroup1 = "jmsth"
    CostGroup2 = "ec2-servers"
  }
}

resource "aws_instance" "instance1" {
  ami           = "ami-0614680123427b75e"
  instance_type = "t2.micro"
  tags          = local.common_tags

}

resource "aws_instance" "instance2" {
  ami           = "ami-0614680123427b75e"
  instance_type = "t2.nano"
  tags          = local.common_tags

}
