#
output "aws_internet_gateway_ig_euc1_id" {
  description = "IG EUC1 VPC"
  value       = aws_internet_gateway.igw_euc1.id
}
#
output "nat_gw_euc1_id" {
  value       = aws_nat_gateway.euc1_nat_priv.*.id
  description = "NAT GW EUC1"
}

#
#