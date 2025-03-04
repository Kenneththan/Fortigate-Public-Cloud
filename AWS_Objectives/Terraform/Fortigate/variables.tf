variable "enable_sdn_access" {
  default     = true
  description = "Enable FortiGate SDN access to AWS resources"
  type        = bool
}

variable "name" {
  default     = "FFT"
  description = "Name of this Fortigate instance"
  type        = string
}

variable "region" {
  default = "eu-west-1"
}

variable "az1" {
  default = "eu-west-1a"
}

variable "license_type_FortiGate" {
  default     = "payg"
}

variable "fgtvmami" {
  type = map(any)
  default = {
    us-east-1      = "ami-03e7e7d91a52ca5a8"
    us-east-2      = "ami-0e113c50f06a97400"
    us-west-1      = "ami-082652dab4c2b2b08"
    us-west-2      = "ami-07088d7493c5a0800"
    af-south-1     = "ami-0295c5080b9805520"
    ap-east-1      = "ami-02be0ef8447edb43e"
    ap-southeast-3 = "ami-068ba85d1fa328916"
    ap-south-1     = "ami-05ba002f63a1766d3"
    ap-northeast-3 = "ami-07174a037bf829c0c"
    ap-northeast-2 = "ami-0e12f8836f40e8b3e"
    ap-southeast-1 = "ami-06dee2ed266b9cf09"
    ap-southeast-2 = "ami-0ea305a185f601084"
    ap-northeast-1 = "ami-0f507a2fdcdacd65d"
    ca-central-1   = "ami-0023a316c322bddae"
    eu-central-1   = "ami-0c2627a529b12b091"
    eu-west-1      = "ami-0788ecffa9d575080"
    eu-west-2      = "ami-09310a84e790cc655"
    eu-south-1     = "ami-0a52973d2d3c48130"
    eu-west-3      = "ami-04f09fc1ddc84c818"
    eu-north-1     = "ami-01a6be2c952f7ac23"
    me-south-1     = "ami-0f2d1a2615e27b2e7"
    sa-east-1      = "ami-008d212dd6df8933c"
  }
}

variable "fgtvmbyolami" {
  type = map(any)
  default = {
    us-east-1      = "ami-032243089115c1b41"
    us-east-2      = "ami-0cdd1e37a58060fb2"
    us-west-1      = "ami-0c186535bfe65e6a9"
    us-west-2      = "ami-00f2435b18a726cb3"
    af-south-1     = "ami-0b5e8f16375316cb4"
    ap-east-1      = "ami-0dc7049dd8a89b636"
    ap-southeast-3 = "ami-02ff5d3364918898f"
    ap-south-1     = "ami-03b839ccc4c60c4a8"
    ap-northeast-3 = "ami-0f8b2411b91fafcb5"
    ap-northeast-2 = "ami-057b40cc79c1578ca"
    ap-southeast-1 = "ami-05327079c9dffad9a"
    ap-southeast-2 = "ami-0e5fa71b70b18b75e"
    ap-northeast-1 = "ami-0658131c7742f44df"
    ca-central-1   = "ami-01ebba0e8198224e3"
    eu-central-1   = "ami-0f44d2b3c1fb0bfd1"
    eu-west-1      = "ami-0c2293c1c0708af3d"
    eu-west-2      = "ami-006c8985b117c010f"
    eu-south-1     = "ami-0ceca56dd744d9a15"
    eu-west-3      = "ami-0312f6fac3eb9ac02"
    eu-north-1     = "ami-0f447d0d4bf789557"
    me-south-1     = "ami-0e306d1aa0d47cb0d"
    sa-east-1      = "ami-0b2633f80602f6e0d"
  }
}

variable "size_FortiGate" {
  default = "c5n.xlarge"
}

variable "adminsport" {
  default = "8443"
}

variable "admin_password" {
  default = "Fortinet1!"
}

//variable "bootstrap-fgtvm" {
  // Change to your own path
//  type    = string
//  default = "fgtvm.conf"
//}

variable "license" {
  // Change to your own byol license file, license.lic
  type    = string
  default = "license.lic"
}