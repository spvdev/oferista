# Create ECS cluster
resource "aws_ecs_cluster" "ecs_cluster" {
  name = "ecs_${var.product_label}"

}