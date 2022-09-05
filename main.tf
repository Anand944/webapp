resource "azurerm_resource_group" "rg" {
  name     = "rg07"
  location = "West Europe"
  tags{
    environment = "prod"
  }
}

resource "azurerm_service_plan" "asp" {
  name                = "asp07"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  reserved            = true
  sku{
    tier = "Standard"
    size = "s1"
    
  }
  tags = {
    environment = "prod"
  }
}
resource "azurerm_app_service" "as" {
  name                = "as07"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.asp.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }
 tags = {
    environment = "prod"
  }
 
}
