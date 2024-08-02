#
resource "aws_security_group" "sg_cmd" {
  name = "sg_cmd"
  description = "cmd"
#SSH
    ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = [local.vpc_euc1_cidr]
      description = "SSH access"
    }

# DNS internal
    # ingress {
    #   from_port   = 53
    #   to_port     = 53
    #   protocol    = "udp"
    #   cidr_blocks = [local.vpc_euc1_cidr]
    #   description = "DNS access for all VPC"
    # }

    ingress {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = [local.vpc_euc1_cidr]
      description = "HTTP Consul access"
    }

       egress {
         from_port = 0
         to_port   = 0
         protocol  = "-1"
         cidr_blocks = ["0.0.0.0/0"]
         description = "Outgoing traffic"
       }

  vpc_id = local.vpc_euc1_id

  tags = {
    Name        = "sg_cmd"
    Product     = var.product_label
    Provider    = "TERRAFORM"
    Environment = "MGMT"
  }

}
