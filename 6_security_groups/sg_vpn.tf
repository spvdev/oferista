#
resource "aws_security_group" "sg_vpn" {
  name = "sg_vpn"
  description = "vpn_devops_access"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP redirect"
  }
### USE ONLY FOR ADMIN ACCESS TO VPN
#  ingress {
#    from_port   = 443
#    to_port     = 443
#    protocol    = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#    description = "HTTPS access"
#  }
### USE ONLY FOR ADMIN ACCESS TO VPN

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [local.vpc_euc1_cidr]
    description = "HTTPS access"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [local.vpc_euc1_cidr]
    description = "SSH access"
  }
  ### DANGEROUS RULE, USE ONLY FOR EMERGENCY 
#   ingress {
#    from_port   = 22
#    to_port     = 22
#    protocol    = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#    description = "SSH access"
#  }
  ### DANGEROUS RULE, USE ONLY FOR EMERGENCY

  ingress {
    from_port   = 10130
    to_port     = 10130
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "VPN-DevOps-Team"
  }

#

#
egress {
  from_port = 0
  to_port   = 0
  protocol  = "-1"
  cidr_blocks = ["0.0.0.0/0"]

}
#
vpc_id = local.vpc_euc1_id
  tags = {
    Name = "sg_vpn"
    Product = var.product_label
    Provider = "TERRAFORM"
    Environment = "EUC1"
  }
}
#