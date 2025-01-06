resource "aws_instance" "myec2" {
  ami           = "ami-0614680123427b75e"
  instance_type = var.type
}
