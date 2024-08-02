#
resource "aws_security_group" "sg_80" {
  vpc_id = local.vpc_euc1_id
  name = "sg_80"
  description = "ssh access, nomad/consul"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "WEB 80 port access"
  }

}
