provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "myec2" {
  ami                    = "ami-0614680123427b75e"
  instance_type          = "t2.micro"
  key_name               = "jmsth43-33"
  vpc_security_group_ids = [aws_security_group.allow_ports.id]

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install httpd -y ",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd"

    ]
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("./jmsth43-33.pem")
      host        = self.public_ip
    }

  }
  provisioner "local-exec" {
    command = "echo ${aws_instance.myec2.private_ip} >> private_ips.txt"
  }
  tags = {
    Name = "tf-example"
  }
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "allow_ports" {
  name        = "allow_ports"
  description = "Allow inbound traffic"
  vpc_id      = data.aws_vpc.default.id
  ingress {
    description = "http from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "ssh port"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ports"
  }
}


