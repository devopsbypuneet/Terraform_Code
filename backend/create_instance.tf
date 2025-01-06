provider "aws" {
  region = "ap-south-1"

}
terraform {
  backend "s3" {
    bucket         = "terraform43-backend"
    key            = "ec2.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform43_backend_db_table"
   # access_key = "YOUR-ACCESS-KEY"
  #  secret_key = "YOUR-SECRET-KEY"

  }
}
resource "aws_instance" "myec2instance" {
  ami           = "ami-0cda377a1b884a1bc"
  instance_type = "t2.micro"
}


