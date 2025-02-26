//External Route
//==============
output "externalroute_gateway_id" {
	value = aws_route.externalroute.gateway_id
}
output "externalroute_id" {
	value = aws_route.externalroute.id
}
output "externalroute_instance_id" {
	value = aws_route.externalroute.instance_id
}
output "externalroute_route_table_id" {
	value = aws_route.externalroute.route_table_id
}

//Private Route Table
//===================
output "fgtvmprivatert_id" {
	value = aws_route_table.fgtvmprivatert.id
}
output "fgtvmprivatert_tags" {
	value = aws_route_table.fgtvmprivatert.tags
}

//Public Route Table
//==================
output "fgtvmpublicrt_id" {
	value = aws_route_table.fgtvmpublicrt.id
}
output "fgtvmpublicrt_tags" {
	value = aws_route_table.fgtvmpublicrt.tags
}

//Private Association
//===================
output "internalassociate_id" {
	value = aws_route_table_association.internalassociate.id
}
output "internalassociate_route_table_id" {
	value = aws_route_table_association.internalassociate.route_table_id
}
output "internalassociate_subnet_id" {
	value = aws_route_table_association.internalassociate.subnet_id
}

//Public Association
//==================
output "public1associate_id" {
	value = aws_route_table_association.public1associate.id
}
output "public1associate_route_table_id" {
	value = aws_route_table_association.public1associate.route_table_id
}
output "public1associate_subnet_id" {
	value = aws_route_table_association.public1associate.subnet_id
}

//Security Group Public - Public_Allow
//====================================
output "sg_public_id" {
	value = aws_security_group.allow_all.id
}

//Security Group Internal - Allow_All
//===================================
output "sg_internal_id" {
	value = aws_security_group.public_allow.id
}

//Write Output Values to a File
//=============================
resource "local_file" "sg_public_id" {
	content = aws_security_group.allow_all.id
	filename = "sg_public_id"
}

resource "local_file" "sg_internal_id" {
	content = aws_security_group.public_allow.id
	filename = "sg_internal_id"
}

resource "local_file" "fgtvmprivatert_id" {
	content = aws_route_table.fgtvmprivatert.id
	filename = "fgtvmprivatert_id"
}