variable "az1" {
  default = "eu-west-1a"
}

variable "webserverami" {
  type = map(any)
  default = {
	eu-west-1 = "ami-096f8c32c1df88f22"
  }
}

variable "license_type_WebServer" {
  default     = "payg"
}

variable "size_WebServer" {
  default = "t2.micro"
}

variable "region" {
  default = "eu-west-1"
}