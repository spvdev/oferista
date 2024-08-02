#
resource "aws_security_group" "sg_egress" {
  vpc_id = local.vpc_euc1_id
  name = "sg_egress"
  description = "egress to all"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
