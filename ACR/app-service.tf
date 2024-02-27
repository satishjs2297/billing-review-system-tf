resource "azurerm_resource_group" "review" {
  name     = "${var.name}-as-rg"
  location = var.location
}

resource "azurerm_app_service_plan" "review" {
  name                = "${var.name}-appserviceplan"
  location            = azurerm_resource_group.review.location
  resource_group_name = azurerm_resource_group.review.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "review" {
  name                = "${var.name}-app-service"
  location            = azurerm_resource_group.review.location
  resource_group_name = azurerm_resource_group.review.name
  app_service_plan_id = azurerm_app_service_plan.review.id

  app_settings = {
    "SOME_KEY" = "some-value"
  }

}