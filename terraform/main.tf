data "aws_vpc" "default_vpc" {
  default = true
}

data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default_vpc.id]
  }
}

data "aws_ami" "amazon-linux-2" {
  owners = ["self"]
  filter {
    name   = "name"
    values = ["packer-demo*"]
  }
}

resource "aws_launch_template" "asg-lt" {
  name          = var.aws_launch_template_name
  image_id      = data.aws_ami.amazon-linux-2.id
  instance_type = var.instance_type
  #key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.server-sg.id]

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = var.instance_name
    }
  }
}

resource "aws_alb_target_group" "app-lb-tg" {
  name        = var.load_balancer_target_group_name
  port        = 80
  protocol    = "HTTP"
  vpc_id      = data.aws_vpc.default_vpc.id
  target_type = "instance"

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 3
  }
}

resource "aws_alb" "app-lb" {
  name = var.load_balancer_name
  #ip_address_type    = "ipv4"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-sg.id]
  subnets            = data.aws_subnets.subnets.ids
}

resource "aws_alb_listener" "app-listener" {
  load_balancer_arn = aws_alb.app-lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.app-lb-tg.arn
  }
}

resource "aws_autoscaling_group" "app-asg" {
  max_size                  = 3
  min_size                  = 1
  desired_capacity          = 2
  name                      = var.aws_autoscaling_group_name
  health_check_grace_period = 300
  health_check_type         = "ELB"
  target_group_arns         = [aws_alb_target_group.app-lb-tg.arn]
  vpc_zone_identifier       = aws_alb.app-lb.subnets

  launch_template {
    id      = aws_launch_template.asg-lt.id
    version = aws_launch_template.asg-lt.latest_version
    # version = "$Latest"
  }
}
