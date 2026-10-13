rg = {
  rg1 = {
    name     = "rg-dhondhu"
    location = " central india"
  }
  rg2 = {
    name     = "rg-bhondhu"
    location = " central india"
  }

}

vnets = {
  vnet1 = {
    name                = "virtualnetwork1"
    resource_group_name = "rg-dhondhu"
    location            = "central india"
    address_space       = ["10.0.0.0/16"]

  }
}

subnets = {
  subnet1 = {
    name                 = "frontend"
    resource_group_name  = "rg-dhondhu"
    virtual_network_name = "virtualnetwork1"
    address_prefixes     = ["10.0.1.0/24"]

  }

  subnet2 = {
    name                 = "backend"
    resource_group_name  = "rg-dhondhu"
    virtual_network_name = "virtualnetwork1"
    address_prefixes     = ["10.0.2.0/24"]

  }

}

nic = {
  nic1 = {
    name                          = "nic-frontend"
    resource_group_name           = "rg-dhondhu"
    location                      = "central india"
    ip-name                       = "lenovo"
    subnet_name                   = "frontend"
    virtual_network_name          = "virtualnetwork1"
    private_ip_address_allocation = "Dynamic"
  }
}

vms = {

  vm1 = {

    name                 = "frontend-vm"
    location             = " central india"
    resource_group_name  = "rg-dhondhu"
    admin_username       = "devopsinsider"
    admin_password       = "Auth@1234"
    size                 = "Standard_D4_v5"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    nic_name             = "nic-frontend"

  }
}