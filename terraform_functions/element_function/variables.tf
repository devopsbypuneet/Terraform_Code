variable "env" {
  default = "dev"
}
variable "tags" {
  type    = list(any)
  default = ["firstec2", "secondec2"]
}
variable "type" {
  type = map(any)
  default = {
    "dev"   = "t2.micro"
    "stage" = "t2.medium"
  }
}
