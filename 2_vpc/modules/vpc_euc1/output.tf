
output "vpc_euc1_id" {
  value = aws_vpc.vpc_euc1.id
}
output "vpc_euc1_cidr" {
  value = aws_vpc.vpc_euc1.cidr_block
}
output "euc1_ipv4_sbn_cidr" {
    value = [for index in range(9):
             cidrsubnet(var.vpc_cidr_euc1, 8, index)]
}
##
