variable "region" {
  default = "ap-southeast-1"
}
variable "ami_id" {
  default = "ami-00942d7cd4f3ca5c0"
}
variable "instance_class" {
  default = "t2.micro"
}
variable "key-name"{
    description = "ssh key to launch the instance"
}
