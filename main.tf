provider "azurerm" { 
  features{} 
}

variable "subs" { 
  type = map(string) 
  default = { 
    "development" = "dev" 
    "test" = "tst"
  }
}

# variable "test" {
  
# }

locals {
  subscription_short_name = { 
    "development" = "dev"
    "test" = "tst"
    "Lab" = "Test Lab"
  }
  test = "${data.azurerm_subscription.current.display_name}"
  # test = "Lab"
}

data "azurerm_subscription" "current" {
}

output "current_subscription_display_name" { 
  value = data.azurerm_subscription.current.display_name 
} 

output "current_subscription_display_name2" { 
  value = local.test
} 

output "localvalue" { 
  value = local.subscription_short_name["${local.test}"]
}
