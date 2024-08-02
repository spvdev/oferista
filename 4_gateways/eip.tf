#EIP for VPC_NAT_PRIV
resource "aws_eip" "nat_priv_euc1" {
  count  = length(var.availability_zones_euc1)
  domain = "vpc"
  # lifecycle {
  #   prevent_destroy = true
  # }
  tags = {
    Name        = "eip-nat-gw-${var.availability_zones_euc1[count.index]}"
    Product     = var.product_label
    Provider    = "TERRAFORM"
    Environment = "EUC1"
  }
}
#
