resource "null_resource" "ansible" {

  # Changes to the instance will cause the null_resource to be re-executed
  triggers = {
    instance_ids = azurerm_linux_virtual_machine.this.id
  }

    # Running the remote provisioner like this ensures that ssh is up and running
    # before running the local provisioner

    provisioner "remote-exec" {
      inline = ["sudo apt update && sudo apt install -y ansible && ansible --version"]
    }

  connection {
    type        = "ssh"
    user        = azurerm_linux_virtual_machine.this.admin_username
    private_key = file("/Users/niki/.ssh/id_rsa")
    host        = azurerm_public_ip.this.ip_address
  }

  # Note that the -i flag expects a comma separated list, so the trailing comma is essential!

  # provisioner "local-exec" {
  #   command = "ansible-playbook /Users/niki/Library/CloudStorage/OneDrive-FLEXIDEVPTYLTD/codes/tm-ec2/ansible/playbook.yml -u ubuntu -i '${module.ec2-instance.public_ip},' "
  # }

  provisioner "file" {
    source      = "./ansible/playbook.yaml"
    destination = "/home/${azurerm_linux_virtual_machine.this.admin_username}/playbook.yaml"
  }

  provisioner "file" {
    source      = "./ansible/install.sh"
    destination = "/home/${azurerm_linux_virtual_machine.this.admin_username}/install.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update && sudo apt install -y ansible && ansible --version",
      "ansible-playbook /home/${azurerm_linux_virtual_machine.this.admin_username}/playbook.yaml"
    ]
  }
}