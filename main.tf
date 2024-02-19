resource "azurerm_resource_group" "SOC_resources" {
  name     = "SOC_resources"
  location = "France Central"
}

resource "azurerm_virtual_network" "SOC_net" {
  name                = "SOC_net"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.SOC_resources.location
  resource_group_name = azurerm_resource_group.SOC_resources.name
}

resource "azurerm_subnet" "SOC_subnet" {
  name                 = "SOC_subnet"
  resource_group_name  = azurerm_resource_group.SOC_resources.name
  virtual_network_name = azurerm_virtual_network.SOC_net.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "SOC_pubip" {
  name                = "SOC_pubip"
  location            = azurerm_resource_group.SOC_resources.location
  resource_group_name = azurerm_resource_group.SOC_resources.name
  allocation_method   = "Dynamic"
  domain_name_label = "audioprothese"
}

resource "azurerm_network_interface" "SOC_nic" {
  name                    = "SOC_nic"
  location                = azurerm_resource_group.SOC_resources.location
  resource_group_name     = azurerm_resource_group.SOC_resources.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.SOC_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.SOC_pubip.id
  }
}

resource "azurerm_ssh_public_key" "SOC_sshkey" {
  name                = "SOC_sshkey"
  resource_group_name = azurerm_resource_group.SOC_resources.name
  location            = "France Central"
  public_key          = file("./.ssh/soc.pub")
}

resource "azurerm_linux_virtual_machine" "SOC_vm" {
  name                  = "SOC"
  location              = azurerm_resource_group.SOC_resources.location
  resource_group_name   = azurerm_resource_group.SOC_resources.name
  network_interface_ids = [azurerm_network_interface.SOC_nic.id]
  size                  = "Standard_E4_v4"
  admin_username        = "adminuser"
  admin_ssh_key {
    username   = "adminuser"
    public_key = azurerm_ssh_public_key.SOC_sshkey.public_key
  }
  admin_password = "b46adYGG3zo8NLhEmgwY"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
}