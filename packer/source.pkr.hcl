source "amazon-ebs" "demo" {
  ami_name      = "packer-demo-ami"
  instance_type = var.instance_type
  region        = var.region
  source_ami_filter {
    filters = {
      virtualization-type = "hvm"
      name                = "al2023-ami-2023.6.20241212.0-kernel-6.1-x86_64"
      root-device-type    = "ebs"
    }
    most_recent = true
    owners      = ["137112412989"]
  }
  ssh_username = "ec2-user"
}