output "Username_FortiWeb" {
  value = "admin"
}

output "Password_FortiWeb" {
  value = aws_instance.fweb.id
}