provider "aws" {
  region = "ap-south-1"

}

resource "aws_instance" "myec2" {
  ami           = "ami-0614680123427b75e"
  instance_type = lookup(var.instance_type, terraform.workspace, "key is not matched")

}

variable "instance_type" {
  type = map(string)

  default = {
    default = "t2.micro"
    dev     = "t2.nano"
    prd     = "t2.large"
    stage   = "t2.micro"
  }
}
