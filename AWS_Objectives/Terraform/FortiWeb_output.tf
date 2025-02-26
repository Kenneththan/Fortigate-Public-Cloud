#output "FGTPublicIP" {
#  value = "${module.aws_fortigate_creation.FGTPublicIP}"
#}

#output "Username_FortiGate" {
#  value = "admin"
#}

#output "Password_FortiGate" {
#  value = "${module.aws_fortigate_creation.Password_FortiGate}"
#}

output "Username_FortiWeb" {
  value = "${module.aws_fortiweb_creation.Username_FortiWeb}"
}

output "Password_FortiWeb" {
  value = "${module.aws_fortiweb_creation.Password_FortiWeb}"
}
