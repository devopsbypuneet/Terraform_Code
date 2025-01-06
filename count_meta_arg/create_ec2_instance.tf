provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "web" {
  ami           = "ami-0614680123427b75e"
  instance_type = var.instance_type[count.index]
  count         = 2
  tags = {
    Name = var.name[count.index]
  }

}
