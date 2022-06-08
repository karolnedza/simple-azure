provider "aviatrix" {
  username = ""
  controller_ip = ""
  password = ""
}

terraform {
    required_providers {
      aviatrix = {
            source  = "aviatrixsystems/aviatrix"
            version = "2.22"
        }
    }
}
