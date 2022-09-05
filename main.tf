resource "azurerm_resource_group" "rg" {
  name     = "rg07"
  location = "West Europe"
 
}

resource "azurerm_service_plan" "example" {
  name                = "aservicep"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "webappline" {
  name                = "alinewebapp07"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_service_plan.example.location
  service_plan_id     = azurerm_service_plan.example.id

  site_config {}
}