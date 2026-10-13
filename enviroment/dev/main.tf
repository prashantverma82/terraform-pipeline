module "rg" {
  source = "../../modules/azurerm_resource_group"

  rg = var.rg

}

module "vnet" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_virtual_network"
  vnets      = var.vnets


}

module "subnet" {
  depends_on = [module.vnet]
  source     = "../../modules/azurem_subnet"
  subnets    = var.subnets
}

module "nic" {
  depends_on = [module.subnet]
  source     = "../../modules/azurerm_network_interface_card"
  nic        = var.nic

}

module "vm" {
  depends_on = [ module.nic ]
  source = "../../modules/azurerm_virtual_linux_machine"
  vms    = var.vms

}