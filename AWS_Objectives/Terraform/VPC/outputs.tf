//VPC Information Outputs
//=======================
output "vpc_cidr_block" {
	value = aws_vpc.fgtvm-vpc.cidr_block
}

output "vpc_default_network_acl_id" {
	value = aws_vpc.fgtvm-vpc.default_network_acl_id
}

output "vpc_default_security_group_id" {
	value = aws_vpc.fgtvm-vpc.default_security_group_id
}

output "vpc_id" {
	value = aws_vpc.fgtvm-vpc.id
}

output "vpc_main_route_table_id" {
	value = aws_vpc.fgtvm-vpc.main_route_table_id
}

output "vpc_owner_id" {
	value = aws_vpc.fgtvm-vpc.owner_id
}

output "vpc_tags" {
	value = aws_vpc.fgtvm-vpc.tags
}

//Public Subnet Outputs
//=====================
output "publicsubnet_availability_zone" {
	value = aws_subnet.publicsubnetaz1.availability_zone
}

output "publicsubnet_availability_zone_id" {
	value = aws_subnet.publicsubnetaz1.availability_zone_id
}

output "publicsubnet_cidr_block" {
	value = aws_subnet.publicsubnetaz1.cidr_block
}

output "publicsubnet_id" {
	value = aws_subnet.publicsubnetaz1.id
}

output "publicsubnet_tags" {
	value = aws_subnet.publicsubnetaz1.tags
}

//Private Subnet Outputs
//======================
output "privatesubnet_availability_zone" {
	value = aws_subnet.privatesubnetaz1.availability_zone
}

output "privatesubnet_availability_zone_id" {
	value = aws_subnet.privatesubnetaz1.availability_zone_id
}

output "privatesubnet_cidr_block" {
	value = aws_subnet.privatesubnetaz1.cidr_block
}

output "privatesubnet_id" {
	value = aws_subnet.privatesubnetaz1.id
}

output "privatesubnet_tags" {
	value = aws_subnet.privatesubnetaz1.tags
}

//Write Output Values to a File
//=============================
resource "local_file" "privatesubnet_id" {
	content = aws_subnet.privatesubnetaz1.id
	filename = "privatesubnet_id"
}

resource "local_file" "publicsubnet_id" {
	content = aws_subnet.publicsubnetaz1.id
	filename = "publicsubnet_id"
}
