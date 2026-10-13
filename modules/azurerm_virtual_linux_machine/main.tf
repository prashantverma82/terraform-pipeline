data "azurerm_network_interface" "example1" {
    for_each = var.vms 
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}


resource "azurerm_linux_virtual_machine" "vm1" {
    for_each = var.vms
    name = each.value.name
    location = each.value.location
    resource_group_name = each.value.resource_group_name
    admin_username = each.value.admin_username
    admin_password = each.value.admin_password
    network_interface_ids = [data.azurerm_network_interface.example1[each.key].id]
    disable_password_authentication = "false"
    size = each.value.size
    os_disk {
      caching = each.value.caching
      storage_account_type = each.value.storage_account_type
    }
    source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  } 
  
}