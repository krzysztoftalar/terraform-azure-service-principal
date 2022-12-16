# ----------------------------------------------
# Get the configuration of the AzureAD provider
# ----------------------------------------------
data "azuread_client_config" "current" {}

# ----------------------------------------------
# Application
# ----------------------------------------------
resource "azuread_application" "this" {
  display_name     = var.application_display_name
  sign_in_audience = var.sign_in_audience
  owners           = [data.azuread_client_config.current.object_id]

  tags = local.tags
}

# ----------------------------------------------
# Service Principal
# ----------------------------------------------
resource "azuread_service_principal" "this" {
  application_id = azuread_application.this.application_id
  owners         = [data.azuread_client_config.current.object_id]

  description = var.service_principal_description
  notes       = var.service_principal_description

  tags = local.tags
}

# ----------------------------------------------
# Role assignments (in Subscription) for service principal
# ----------------------------------------------
resource "azurerm_role_assignment" "this" {
  for_each = {
    for ra in var.assignments : ra.scope => ra
  }

  principal_id         = azuread_service_principal.this.object_id
  scope                = each.key
  role_definition_name = each.value.role_definition_name
}

# ----------------------------------------------
# Manages a rotating time resource
# ----------------------------------------------
resource "time_rotating" "this" {
  rotation_days = var.password_rotation_in_days

  triggers = {
    days = var.password_rotation_in_days
  }

  lifecycle {
    create_before_destroy = true
  }
}

# ----------------------------------------------
# Application Client Secret
# ----------------------------------------------
resource "azuread_application_password" "this" {
  display_name          = var.application_display_name
  application_object_id = azuread_application.this.object_id

  end_date = var.password_end_date

  rotate_when_changed = {
    rotation = time_rotating.this.id
  }

  lifecycle {
    create_before_destroy = true
  }
}
