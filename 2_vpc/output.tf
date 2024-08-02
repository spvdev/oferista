##
##
output "VPC_EUC1_ID" {
  value       = module.vpc_euc1.vpc_euc1_id
  description = "ID of EUC1 VPC"
}
output "VPC_EUC1_CIDR" {
  value       = module.vpc_euc1.vpc_euc1_cidr
  description = "CIDR of EUC1 VPC"
}
output "VPC_EUC1_IPV4_SBN_CIDR" {
  value       = module.vpc_euc1.euc1_ipv4_sbn_cidr
    description = "IPV4 generated CIDR subnets block"
}
##
output "VPC_EUC1_IPV4_SBN_PUB_CIDR" {
  value       = [module.vpc_euc1.euc1_ipv4_sbn_cidr[0],module.vpc_euc1.euc1_ipv4_sbn_cidr[1],module.vpc_euc1.euc1_ipv4_sbn_cidr[2]]
    description = "IPV4 generated CIDR subnets block pub"
}
output "VPC_EUC1_IPV4_SBN_PRIV01_CIDR" {
  value       = [module.vpc_euc1.euc1_ipv4_sbn_cidr[3],module.vpc_euc1.euc1_ipv4_sbn_cidr[4],module.vpc_euc1.euc1_ipv4_sbn_cidr[5]]
    description = "IPV4 generated CIDR subnets block pub"
}
output "VPC_EUC1_IPV4_SBN_PRIV02_CIDR" {
  value       = [module.vpc_euc1.euc1_ipv4_sbn_cidr[6],module.vpc_euc1.euc1_ipv4_sbn_cidr[7],module.vpc_euc1.euc1_ipv4_sbn_cidr[8]]
    description = "IPV4 generated CIDR subnets block pub"
}
#