
variable "list" {
  type    = list(any)
  default = ["t2.micro", "t2.nano"]
}

variable "instanceid" {
  type    = string
  default = "ami-0614680123427b75e"

}