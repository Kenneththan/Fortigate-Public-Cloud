variable "region" {
  default = "eu-west-1"
}

variable "az1" {
  default = "eu-west-1a"
}

variable "license_type_FortiWeb" {
  default     = "payg"
}

//AMIs are for FortiWeb AWS (PAYG)
variable "fwebvmami" {
  type = map(any)
  default = {
	us-east-1      = "ami-0d4bc3664c2621250"
    us-east-2      = "ami-0bf6110738a7fc7fc"
    us-west-1      = "ami-0f7b471c1cd714ea0"
    us-west-2      = "ami-05f3fd528c584f000"
    af-south-1     = ""
    ap-east-1      = ""
    ap-southeast-3 = ""
    ap-south-1     = "ami-047827db9bca7d5f2"
    ap-northeast-3 = ""
    ap-northeast-2 = "ami-0da7793d0ec60f992"
    ap-southeast-1 = "ami-07fbe63c1214b0763"
    ap-southeast-2 = "ami-074e009f612bad6e0"
    ap-northeast-1 = "ami-0b999a4500cde6ee6"
    ca-central-1   = "ami-00036815a5c124731"
    eu-central-1   = "ami-095118d8b671d4ad6"
    eu-west-1      = "ami-0081159a78a9b033d"
    eu-west-2      = "ami-02b6af5a2cc1bc2b0"
    eu-south-1     = ""
    eu-west-3      = "ami-05631ce410be3dd96"
    eu-north-1     = "ami-0ba6bb16467d844b1"
    me-south-1     = ""
    sa-east-1      = "ami-0734db4f79a8b5605"
  }
}

//AMIs are for FortiWeb AWS (BYOL)
variable "fwebvmbyolami" {
  type = map(any)
  default = {
	us-east-1      = "ami-0c163884916fe1e3f"
    us-east-2      = "ami-0878b64ab12bf0fb1"
    us-west-1      = "ami-0c3eb37bbb0cdb88d"
    us-west-2      = "ami-097e2f406c9a155e2"
    af-south-1     = ""
    ap-east-1      = ""
    ap-southeast-3 = ""
    ap-south-1     = "ami-0f237cb83577f080d"
    ap-northeast-3 = "ami-0a2c8a42ad285c409"
    ap-northeast-2 = "ami-052a10280e1c33bae"
    ap-southeast-1 = "ami-0ee9346c0b38b884f"
    ap-southeast-2 = "ami-0375e52f20452c737"
    ap-northeast-1 = "ami-0fbcacc65c66cae25"
    ca-central-1   = "ami-09b34368393a53b15"
    eu-central-1   = "ami-005261ba3e1476cfb"
    eu-west-1      = "ami-00c1055d034c729fe"
    eu-west-2      = "ami-0407176b86e746fd5"
    eu-south-1     = ""
    eu-west-3      = "ami-0febf2e9908668b3e"
    eu-north-1     = "ami-0b9db635787bd8fca"
    me-south-1     = ""
    sa-east-1      = "ami-0782dbe6854ef228a"
  }
}

variable "size_FortiWeb" {
  default = "c5.large"
}

variable "adminsport" {
  default = "9443"
}

variable "admin_password" {
  default = "Fortinet1!"
}

variable "bootstrap-fwebvm" {
  // Change to your own path
  type    = string
  default = "fweb.conf"
}

variable "license" {
  // Change to your own byol license file, license.lic
  type    = string
  default = "license.lic"
}