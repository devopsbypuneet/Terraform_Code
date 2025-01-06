variable "intype" {
  type = map(any)
  default = {
    dev     = "t2.micro"
    staging = "t2.nano"
  }
}
variable "instanceid" {
  type    = string
  default = "ami-0614680123427b75e"

}