###
output "vpc_sbn_euc1_pub_01_id" {
  description = "List of IDs of pub_01 subnets"
  value       = aws_subnet.sbn_euc1_pub_01.*.id
}
#
output "vpc_sbn_euc1_pub_01_cidr" {
  description = "List of cidr of pub_01 subnets"
  value       = aws_subnet.sbn_euc1_pub_01.*.cidr_block
}
output "vpc_sbn_euc1_priv_01_id" {
  description = "List of IDs of priv_01 subnets"
  value       = aws_subnet.sbn_euc1_priv_01.*.id
}
#
output "vpc_sbn_euc1_priv_01_cidr" {
  description = "List of cidr of priv_01 subnets"
  value       = aws_subnet.sbn_euc1_priv_01.*.cidr_block
}
# output "vpc_sbn_euc1_priv_02_id" {
#   description = "List of IDs of priv_02 subnets"
#   value       = aws_subnet.sbn_euc1_priv_02.*.id
# }
# #
# output "vpc_sbn_euc1_priv_02_cidr" {
#   description = "List of cidr of priv_02 subnets"
#   value       = aws_subnet.sbn_euc1_priv_02.*.cidr_block
# }
###
