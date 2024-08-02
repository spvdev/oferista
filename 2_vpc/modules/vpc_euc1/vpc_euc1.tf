##
resource "aws_vpc" "vpc_euc1" {
  cidr_block           = var.vpc_cidr_euc1
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  assign_generated_ipv6_cidr_block = false

  tags = {
    Name        = var.vpc_name_euc1
    Product     = var.product_label
    Provider    = "TERRAFORM"
    Environment = "EUC1"
  }
}
