variable "ami_name" {
type = string
default = "al2023-ami-2023.6.20241212.0-kernel-6.1-x86_64"
}
variable "region" {
type = string
default = "us-west-2"
}
variable "tags" {   
type = map(string)
default = { name = "demo-ami" }
}

variable "source_ami_owner_ids" {
type    = list(string)
default = ["216989140286"]
}

variable "ansible_playbook_path" {
type   = string
default = "main.yml"
}

variable "source_ami_filter" {
type    = map(string)
default = {}
}
variable "instance_type" {
type    = string
default = "t2.micro"
}
