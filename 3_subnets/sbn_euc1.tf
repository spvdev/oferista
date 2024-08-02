# Subnets Pub
resource "aws_subnet" "sbn_euc1_pub_01" {
  count                           = length(local.vpc_euc1_ipv4_sbn_pub_cidr)
  vpc_id                          = local.vpc_euc1_id
  cidr_block                      = local.vpc_euc1_ipv4_sbn_pub_cidr[count.index]
  availability_zone               = var.availability_zones_euc1[count.index]
  map_public_ip_on_launch         = true
  assign_ipv6_address_on_creation = false

  tags = {
    Name        = "sbn_euc1_pub_01_${element(var.code_zones_euc1, count.index)}"
    Product     = var.product_label
    Provider    = "TERRAFORM"
    Environment = "EUC1"

  }
}
# Subnets Priv 01
resource "aws_subnet" "sbn_euc1_priv_01" {
  count                           = length(local.vpc_euc1_ipv4_sbn_priv01_cidr)
  vpc_id                          = local.vpc_euc1_id
  cidr_block                      = local.vpc_euc1_ipv4_sbn_priv01_cidr[count.index]
  availability_zone               = var.availability_zones_euc1[count.index]
  map_public_ip_on_launch         = false

  tags = {
    Name        = "sbn_euc1_priv_01_${element(var.code_zones_euc1, count.index)}"
    Product     = var.product_label
    Provider    = "TERRAFORM"
    Environment = "EUC1"

  }
}