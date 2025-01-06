provider "aws" {
  region = "ap-south-1"
}

resource "aws_key_pair" "test" {
  key_name   = "test"
  public_key = file("${path.module}/test.pub")

}

resource "aws_instance" "stagging" {
  ami           = "ami-0fd05997b4dff7aac"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.test.key_name
}
