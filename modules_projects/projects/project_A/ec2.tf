provider "aws" {
  region = "ap-south-1"
}

module "ec2module" {
  source = "../../modules/ec2"
  type   = "t2.small"
}
