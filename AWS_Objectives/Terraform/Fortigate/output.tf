output "FGTPublicIP" {
  value = aws_eip.FGTPublicIP.public_ip
}

output "Username_FortiGate" {
  value = "admin"
}

output "Password_FortiGate" {
  value = aws_instance.fgtvm.id
}