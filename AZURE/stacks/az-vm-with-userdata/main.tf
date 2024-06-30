resource "azurerm_resource_group" "this" {
  name     = local.rgName
  location = var.region
}

resource "azurerm_linux_virtual_machine" "this" {
  name                  = "test-vm"
  location              = azurerm_resource_group.this.location
  resource_group_name   = azurerm_resource_group.this.name
  network_interface_ids = [azurerm_network_interface.this.id]
  size               = "Standard_B2s"
  admin_username      = "ubuntu" #if you change this, you will need to change the ansible playbook as well
  admin_ssh_key {
    username   = "ubuntu"
    public_key = file("~/.ssh/id_rsa_primary.pub")
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

}
