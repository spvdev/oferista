# ECS Task Definition
resource "aws_ecs_task_definition" "task" {
  family                   = "${var.product_label}"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([
    {
      name  = "${var.product_label}_container"
      image = "nginx"
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ],
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = aws_cloudwatch_log_group.ecs.name
          "awslogs-region"        = "${var.aws_region}"
          "awslogs-stream-prefix" = "ecs"
        }
      }
    }
  ])
}
# Create CloudWatch Log Group
resource "aws_cloudwatch_log_group" "ecs" {
  name              = "/ecs/${var.product_label}_service"
  retention_in_days = 7
}

resource "aws_ecs_service" "service" {
  name            = "${var.product_label}_service"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.task.id
  desired_count   = 3
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = [local.vpc_euc1_ipv4_sbn_priv_01_id[0],local.vpc_euc1_ipv4_sbn_priv_01_id[1],local.vpc_euc1_ipv4_sbn_priv_01_id[2]]
    security_groups = [local.sg_main_id, local.sg_80_id, local.sg_egress_id]
  }
  
  load_balancer {
    target_group_arn = local.lb_tg_nginx_arn
    container_name   = "${var.product_label}_container"
    container_port   = 80
  }

  depends_on = [local.lstnr_nginx_arn]
}


# IAM Role for ECS Task Execution
resource "aws_iam_role" "ecs_task_execution_role" {
  name = "ecsTaskExecutionRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}

# Attach the AmazonECSTaskExecutionRolePolicy to the role
resource "aws_iam_role_policy_attachment" "ecs_task_execution_policy" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}