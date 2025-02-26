variable "privatesubnet_id" {}
variable "sg_internal_id" {}
variable "key_name" {}

resource "aws_network_interface" "eth3" {
  description = "Web-Server-port1"
  subnet_id   = var.privatesubnet_id
  source_dest_check = false
  private_ips = ["10.10.2.12"]
}

resource "aws_network_interface_sg_attachment" "internalattachment_WebServer" {
  depends_on           = [aws_network_interface.eth3]
  security_group_id    = var.sg_internal_id
  network_interface_id = aws_network_interface.eth3.id
}

resource "aws_instance" "web" {
  ami           = var.license_type_WebServer == "byol" ? var.webserverami[var.region] : var.webserverami[var.region]
  instance_type = var.size_WebServer
  availability_zone = var.az1  
  key_name = var.key_name
  
  network_interface {
    network_interface_id = aws_network_interface.eth3.id
    device_index         = 0
  }

  user_data = <<-EOF
  #!/bin/bash
  echo "*** Installing apache2"
  sudo apt update -y
  sudo apt install apache2 -y
  echo "*** Completed Installing apache2"
  sudo service apache2 start
  EOF

  tags = {
    Name = "Web-Server"
  }

  volume_tags = {
    Name = "Web-Server"
  } 
}