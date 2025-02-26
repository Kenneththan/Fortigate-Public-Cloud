variable "privatesubnet_id" {}
variable "sg_internal_id" {}
variable "key_name" {}

// FWEB instance

resource "aws_network_interface" "eth2" {
	description 	  = "fweb-port1"
	subnet_id         = var.privatesubnet_id
	source_dest_check = false
	private_ips = ["10.10.2.11"]
}

resource "aws_network_interface_sg_attachment" "internalattachment_FortiWeb" {
  depends_on           = [aws_network_interface.eth2]
  security_group_id    = var.sg_internal_id
  network_interface_id = aws_network_interface.eth2.id
}

resource "aws_instance" "fweb" {
  ami               = var.license_type_FortiWeb == "byol" ? var.fwebvmbyolami[var.region] : var.fwebvmami[var.region]
  instance_type     = var.size_FortiWeb
  availability_zone = var.az1
  key_name          = var.key_name
  user_data         = data.template_file.FortiWeb.rendered 

  root_block_device {
    volume_type = "standard"
    volume_size = "2"
  }

  ebs_block_device {
    device_name = "/dev/sdb"
    volume_size = "30"
    volume_type = "standard"
  }

  network_interface {
    network_interface_id = aws_network_interface.eth2.id
    device_index         = 0
  }
  
  tags = {
    Name = "FortiWebVM"
  } 
}

data "template_file" "FortiWeb" {
  template = "${file("FortiWeb/fweb.conf")}"
  vars = {
    type         = "${var.license_type_FortiWeb}"
    license_file = "${var.license}"
    adminsport   = "${var.adminsport}"
	admin_password = "${var.admin_password}"
  }
}
