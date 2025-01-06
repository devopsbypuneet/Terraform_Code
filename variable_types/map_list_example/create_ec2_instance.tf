provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "web" {
  ami           = var.instanceid
  instance_type = var.list[1]
}
