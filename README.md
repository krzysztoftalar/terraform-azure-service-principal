<!-- BEGIN_TF_DOCS -->

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.5 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | >= 2.31.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.35.0 |
| <a name="requirement_time"></a> [time](#requirement\_time) | >= 0.9.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | >= 2.31.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.35.0 |
| <a name="provider_time"></a> [time](#provider\_time) | >= 0.9.1 |

## Resources

| Name | Type |
|------|------|
| [azuread_application.this](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application) | resource |
| [azuread_application_password.this](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application_password) | resource |
| [azuread_service_principal.this](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal) | resource |
| [azurerm_role_assignment.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [time_rotating.this](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/rotating) | resource |
| [azuread_client_config.current](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_display_name"></a> [application\_display\_name](#input\_application\_display\_name) | (Required) The display name for the application. | `string` | n/a | yes |
| <a name="input_assignments"></a> [assignments](#input\_assignments) | (Required) The list of role assignments to the service principal.<br>assignments = {<br>  scope : "The scope at which the Role Assignment applies to, such as `/subscriptions/xxxxx000-0000-0000-0000-xxxx0000xxxx`."<br>  role\_definition\_name : "The name of a built-in Role."<br>} | <pre>list(object({<br>    scope                = string<br>    role_definition_name = string<br>  }))</pre> | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | (Required) The name of the environment. | `string` | n/a | yes |
| <a name="input_management"></a> [management](#input\_management) | (Required) A description of how this resource is managed, such as `Terraform Cloud - Local`, `Terraform Cloud - Remote`. | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | (Required) Company to which the projects belong. | `string` | n/a | yes |
| <a name="input_password_end_date"></a> [password\_end\_date](#input\_password\_end\_date) | (Optional) The relative duration or RFC3339 rotation timestamp after which the password expire. Defaults to the current time. | `string` | `null` | no |
| <a name="input_password_rotation_in_days"></a> [password\_rotation\_in\_days](#input\_password\_rotation\_in\_days) | (Optional) Number of days to add to the base timestamp to configure the rotation timestamp. When the current time has passed the rotation timestamp, the resource will trigger recreation. Defaults to 180 days. | `number` | `180` | no |
| <a name="input_password_rotation_in_years"></a> [password\_rotation\_in\_years](#input\_password\_rotation\_in\_years) | (Optional) Number of years to add to the base timestamp to configure the password rotation timestamp. Defaults to null. | `number` | `null` | no |
| <a name="input_project"></a> [project](#input\_project) | (Required) The name of the project. | `string` | n/a | yes |
| <a name="input_service_principal_description"></a> [service\_principal\_description](#input\_service\_principal\_description) | (Required) A description of the service principal provided for internal end-users. | `string` | n/a | yes |
| <a name="input_sign_in_audience"></a> [sign\_in\_audience](#input\_sign\_in\_audience) | (Optional) The Microsoft account types that are supported for the current application. Must be one of `AzureADMyOrg`, `AzureADMultipleOrgs`, `AzureADandPersonalMicrosoftAccount` or `PersonalMicrosoftAccount`. Defaults to AzureADMyOrg. | `string` | `"AzureADMyOrg"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Required) A mapping of tags to assign to the resource. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_secret"></a> [client\_secret](#output\_client\_secret) | Secret password (client\_secret) for the Service Principal. |

<!-- END_TF_DOCS -->
