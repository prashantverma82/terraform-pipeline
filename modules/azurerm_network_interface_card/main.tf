data "azurerm_subnet" "example" {
for_each = var.nic

  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}



resource "azurerm_network_interface" "nic1" {
    for_each = var.nic
    name = each.value.name
    resource_group_name = each.value.resource_group_name
    location = each.value.location

    ip_configuration {
        name = each.value.ip-name
        subnet_id = data.azurerm_subnet.example[each.key].id
        private_ip_address_allocation = each.value.private_ip_address_allocation


    }


}