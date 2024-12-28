#####################################
# Required AWS Configuration
#####################################

variable "region" {
  default = "us-west-2"
}

variable "profile" {
  default = "default"
}


#######################################
# Required AWS Resources Configuration
#######################################

variable "key_name" {
  default = "virginia"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "instance_name" {
  default = "wordpress-instance"
}

variable "aws_launch_template_name" {
  default = "demo-lt"
}

variable "load_balancer_target_group_name" {
  default = "demo-lb-tg"
}

variable "load_balancer_name" {
  default = "demo-lb"
}

variable "aws_autoscaling_group_name" {
  default = "demo-asg"
}