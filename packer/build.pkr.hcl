build {
  sources = ["source.amazon-ebs.demo"]

  provisioner "shell" {
    inline = [
      "sleep 30;sudo yum install -y ansible"
    ]
  }


  provisioner "ansible-local" {
    command       = "ansible-playbook"
    playbook_files = ["../ansible/main.yml"]
    playbook_dir = "../ansible"

  }

}
