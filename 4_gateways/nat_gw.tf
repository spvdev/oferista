## EUC1
resource "aws_nat_gateway" "euc1_nat_priv" {
  count         = length(var.availability_zones_euc1)
  allocation_id = aws_eip.nat_priv_euc1[count.index].id
  subnet_id     = local.vpc_euc1_ipv4_sbn_pub_id[count.index]
  # lifecycle {
  #   prevent_destroy = true
  # }
  tags = {
    Name    = "nat-gw-euc1-${var.availability_zones_euc1[count.index]}"
    Product = var.product_label
    Provider = "TERRAFORM"
    Environment = "EUC1"
  }
}
#

