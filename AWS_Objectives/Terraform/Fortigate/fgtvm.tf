variable "privatesubnet_id" {}
variable "publicsubnet_id" {}
variable "sg_public_id" {}
variable "sg_internal_id" {}
variable "key_name" {}
variable "fgtvmprivatert_id" {}


// FGTVM instance

resource "aws_network_interface" "eth0" {
  description = "fgtvm-port1"
  subnet_id   = var.publicsubnet_id
  private_ips = ["10.10.1.10"]
}

resource "aws_network_interface" "eth1" {
  description       = "fgtvm-port2"
  subnet_id         = var.privatesubnet_id
  source_dest_check = false
  private_ips = ["10.10.2.10"]
}


resource "aws_network_interface_sg_attachment" "publicattachment" {
  depends_on           = [aws_network_interface.eth0]
  security_group_id    = var.sg_public_id
  network_interface_id = aws_network_interface.eth0.id
}

resource "aws_network_interface_sg_attachment" "internalattachment" {
  depends_on           = [aws_network_interface.eth1]
  security_group_id    = var.sg_internal_id
  network_interface_id = aws_network_interface.eth1.id
}


resource "aws_instance" "fgtvm" {
  ami               = var.license_type_FortiGate == "byol" ? var.fgtvmbyolami[var.region] : var.fgtvmami[var.region]
  iam_instance_profile = aws_iam_instance_profile.this.name
  instance_type     = var.size_FortiGate
  availability_zone = var.az1
  key_name          = var.key_name
  user_data         = data.template_file.FortiGate.rendered

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
    network_interface_id = aws_network_interface.eth0.id
    device_index         = 0
  }

  network_interface {
    network_interface_id = aws_network_interface.eth1.id
    device_index         = 1
  }

  tags = {
    Name = "FortiGateVM"
  }
}

resource "aws_route" "internalroute" {
  depends_on             = [aws_instance.fgtvm]
  route_table_id         = var.fgtvmprivatert_id
  destination_cidr_block = "0.0.0.0/0"
  network_interface_id   = aws_network_interface.eth1.id
}

resource "aws_eip" "FGTPublicIP" {
  depends_on        = [aws_instance.fgtvm]
  vpc               = true
  network_interface = aws_network_interface.eth0.id
}


data "template_file" "FortiGate" {
template = "${file("FortiGate/fgtvm.conf")}"
  vars = {
    type         = "${var.license_type_FortiGate}"
    license_file = "${var.license}"
    adminsport   = "${var.adminsport}"
	admin_password = "${var.admin_password}"
  }
}
