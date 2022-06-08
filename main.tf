#### Transit Singapore
module "transit_azure_1" {
  source  = "terraform-aviatrix-modules/azure-transit/aviatrix"
  version = "99.9"
  cidr = "10.1.0.0/20"
  region = "Southeast Asia"
  account = "azure-account-sec"
  ha_gw = false
  az_support = false
  instance_size = "Standard_D8s_v4"
}

#### Transit India

module "transit_azure_2" {
  source  = "terraform-aviatrix-modules/azure-transit/aviatrix"
  version = "99.9"
  cidr = "10.2.0.0/20"
  region = "Central India"
  account = "azure-account-sec"
  ha_gw = false
  az_support = false
}

#### Spoke India 1
module "mc-spoke_1" {
  source  = "terraform-aviatrix-modules/mc-spoke/aviatrix"
  version = "1.2.1"
  az_support = false
  ha_gw = false
  cloud = "azure"
  region = "Central India"
  account = "azure-account-sec"
  transit_gw = "avx-central-india-transit"
  name = "spoke-india-vm"
  cidr = "10.100.1.0/24"
}

#### Spoke India 2

module "mc-spoke_3" {
  source  = "terraform-aviatrix-modules/mc-spoke/aviatrix"
  version = "1.2.1"
  az_support = false
  ha_gw = false
  cloud = "azure"
  region = "Central India"
  account = "azure-account-sec"
  transit_gw = "avx-central-india-transit"
  name = "spoke-india-server"
  cidr = "10.101.1.0/24"
}

#### Spoke Singapore

module "mc-spoke_2" {
  source  = "terraform-aviatrix-modules/mc-spoke/aviatrix"
  version = "1.2.1"
  az_support = false
  ha_gw = false
  cloud = "azure"
  region = "Southeast Asia"
  account = "azure-account-sec"
  transit_gw = "avx-southeast-asia-transit"
  name = "spoke-singapore-vm"
  cidr = "10.200.1.0/24"
  instance_size = "Standard_D8s_v4"
}
