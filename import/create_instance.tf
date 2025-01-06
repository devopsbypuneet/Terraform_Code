provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "myec2" {
  ami = "ami-0fd05997b4dff7aac"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0677a4eec5bce7813"]
  subnet_id = "subnet-08a135a8f9368a4bf"
  tags = {
    Name = "tf-import",
    BU = "jmsth",
    ENV = "dev"
  }
}


