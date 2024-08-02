#
output "alb_on_prem_interconnect_arn" {
  value = aws_lb.аlb_on_prem_interconnect.arn
}
#
output "tg_nginx_arn" {
  value = aws_lb_target_group.nginx.arn
}
#
output "lstnr_nginx_arn" {
  value = aws_lb_listener.lstnr_nginx.arn
}
#
output "alb_dns" {
  value = aws_lb.аlb_on_prem_interconnect.dns_name
}