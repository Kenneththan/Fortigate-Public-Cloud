data "local_file" "privatesubnet_id" {
	filename = var.privatesubnet_id
}

data "local_file" "publicsubnet_id" {
	filename = var.publicsubnet_id
}

data "local_file" "sg_public_id" {
	filename = var.sg_public_id
}

data "local_file" "sg_internal_id" {
	filename = var.sg_internal_id
}

data "local_file" "fgtvmprivatert_id" {
	filename = var.fgtvmprivatert_id
}

resource "aws_key_pair" "my_key_pair" {
  key_name   = var.key_name
  public_key = file("${abspath(path.cwd)}/my-key.pub")
}

module "aws_vpc_creation" {
	source = "./VPC"
}

module "aws_network_creation" {
	source = "./Network"
	vpc_id = "${module.aws_vpc_creation.vpc_id}"
	privatesubnet_id = data.local_file.privatesubnet_id.content
	publicsubnet_id = data.local_file.publicsubnet_id.content
}

module "aws_fortigate_creation" {
	source = "./FortiGate"
	privatesubnet_id = data.local_file.privatesubnet_id.content
	publicsubnet_id = data.local_file.publicsubnet_id.content
	fgtvmprivatert_id = data.local_file.fgtvmprivatert_id.content
	sg_public_id = data.local_file.sg_public_id.content
	sg_internal_id = data.local_file.sg_internal_id.content
	key_name = var.key_name
}

module "aws_webserver_creation" {
	source = "./WebServer"
	privatesubnet_id = data.local_file.privatesubnet_id.content
	sg_internal_id = data.local_file.sg_internal_id.content
	key_name = var.key_name
}

module "aws_fortiweb_creation" {
	source = "./FortiWeb"
	privatesubnet_id = data.local_file.privatesubnet_id.content
	sg_internal_id = data.local_file.sg_internal_id.content
	key_name = var.key_name
}
