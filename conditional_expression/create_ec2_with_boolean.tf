provider "aws" {
  region = "ap-south-1"
}



resource "aws_instance" "dev" {
  ami           = "ami-0614680123427b75e"
  instance_type = "t2.micro"
  count         = var.environment == "dev" ? 1 : 0
  tags = {
    Name = "dev"
  }
}

resource "aws_instance" "prod" {
  ami           = "ami-0614680123427b75e"
  instance_type = "t2.medium"
  count         = var.environment == "prod" ? 1 : 0
  tags = {
    Name = "prod"
  }

}

