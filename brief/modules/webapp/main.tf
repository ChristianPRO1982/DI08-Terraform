data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_service_plan" "plan" {
  name                = "${var.name_prefix}-webapp-plan"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location

  os_type  = "Linux"
  sku_name = var.sku_name
}

resource "azurerm_linux_web_app" "app" {
  name                = "${var.name_prefix}-webapp"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  service_plan_id     = azurerm_service_plan.plan.id

  site_config {}
}
