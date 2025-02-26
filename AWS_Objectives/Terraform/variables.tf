//AWS Configuration
variable "access_key" {}
variable "secret_key" {}

variable "region" {
  default = "eu-west-1"
}

variable "key_name" {
  default = "id_rsa.pub"
}

variable "privatesubnet_id" {
  default = "privatesubnet_id"
}

variable "publicsubnet_id" {
  default = "publicsubnet_id"
}

variable "sg_public_id" {
  default = "sg_public_id"
}

variable "sg_internal_id" {
  default = "sg_internal_id"
}

variable "fgtvmprivatert_id" {
  default = "fgtvmprivatert_id"
}