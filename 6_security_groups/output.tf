#
output "sg_cmd_id" {
  description = "SG CMD ID"
  value       = aws_security_group.sg_cmd.id
}
#
output "sg_vpn_id" {
  description = "SG VPN ID"
  value       = aws_security_group.sg_vpn.id
}
#
output "sg_main_id" {
  description = "SG MAIN ID"
  value       = aws_security_group.sg_main.id
}
#
output "sg_80_id" {
  description = "SG 80 ID"
  value       = aws_security_group.sg_80.id
}
#
output "sg_egress_id" {
  description = "SG EGRESS ID"
  value       = aws_security_group.sg_egress.id
}
## 