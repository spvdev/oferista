#
resource "aws_lb" "аlb_on_prem_interconnect" {
  name                             = "alb-on-prem-interconnect"  
  internal                         = false                         
  load_balancer_type               = "application"
  subnets                          = local.vpc_sbn_euc1_pub_01_id
  security_groups                  = [local.sg_80_id,local.sg_egress_id]
  enable_cross_zone_load_balancing = true
  enable_deletion_protection       = false # should be changed
  tags = {
    Environment       = "Production"
    Name              = "alb-on-prem-interconnect"
    Product           = var.product_label
    Spec              = "INERCONNECT"
    Provider          = "TERRAFORM"
  }
}
#
resource "aws_lb_listener" "lstnr_nginx" {
  load_balancer_arn = aws_lb.аlb_on_prem_interconnect.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nginx.arn
  }
  tags = {
    Environment       = "Production"
    Name              = "lstnr-nginx"
    Product           = var.product_label
    Spec              = "INTERCONNECT"
    Provider          = "TERRAFORM"
  }
}
#
resource "aws_lb_target_group" "nginx" {
  name        = "tg-nginx"
  target_type = "ip"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = local.vpc_euc1_id
  health_check {
    path              = "/"
    port              = 80
    interval          = 10
    healthy_threshold = 3
    protocol = "HTTP"
    matcher = "200-405"
  }
  stickiness {
    type    = "lb_cookie"
    enabled = true
  }
  tags = {
    Environment       = "Production"
    Name              = "tg-nginx"
    Product           = var.product_label
    Spec              = "INERCONNECT"
    Provider          = "TERRAFORM"
  }
}

#
#