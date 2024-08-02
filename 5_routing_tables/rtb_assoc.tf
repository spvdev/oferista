## EUC1
resource "aws_route_table_association" "rtb_assoc_pub" {
  count = length(var.code_zones_euc1)
  subnet_id      = element(local.vpc_euc1_ipv4_sbn_pub_id.*, count.index)
  route_table_id = aws_route_table.rtb_euc1_pub.id
} ## association RT to SBN Public

#
resource "aws_route_table_association" "rtb_assoc_priv_01" {
  count = length(var.code_zones_euc1)
  subnet_id      = element(local.vpc_euc1_ipv4_sbn_priv_01_id.*, count.index)
  route_table_id = element([aws_route_table.rtb_euc1_priv_a.id,aws_route_table.rtb_euc1_priv_b.id,aws_route_table.rtb_euc1_priv_c.id], count.index)
} ## association RT to SBN Privat 01

####
