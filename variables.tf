variable "owner" {
  description = "(Required) Company to which the projects belong."
  type        = string
}

variable "project" {
  description = "(Required) The name of the project."
  type        = string
}

variable "environment" {
  description = "(Required) The name of the environment."
  type        = string
}

variable "management" {
  description = "(Required) A description of how this resource is managed, such as `Terraform Cloud - Local`, `Terraform Cloud - Remote`."
  type        = string
}

variable "application_display_name" {
  description = "(Required) The display name for the application."
  type        = string
}

variable "sign_in_audience" {
  description = "(Optional) The Microsoft account types that are supported for the current application. Must be one of `AzureADMyOrg`, `AzureADMultipleOrgs`, `AzureADandPersonalMicrosoftAccount` or `PersonalMicrosoftAccount`. Defaults to AzureADMyOrg."
  type        = string
  default     = "AzureADMyOrg"
}

variable "assignments" {
  description = <<-EOT
    (Required) The list of role assignments to the service principal.
    assignments = {
      scope : "The scope at which the Role Assignment applies to, such as `/subscriptions/xxxxx000-0000-0000-0000-xxxx0000xxxx`."
      role_definition_name : "The name of a built-in Role."
    }
  EOT
  type = list(object({
    scope                = string
    role_definition_name = string
  }))
}

variable "service_principal_description" {
  description = "(Required) A description of the service principal provided for internal end-users."
  type        = string
}

variable "password_end_date" {
  description = "(Optional) The end date until which the password is valid, formatted as an RFC3339 date string (e.g. 2018-01-01T01:02:03Z). Defaults to 1 year (automatically set by Azure)."
  type        = string
  default     = null
}

variable "password_rotation_in_days" {
  description = "(Required) Number of days to add to the base timestamp to configure the rotation timestamp. When the current time has passed the rotation timestamp, the resource will trigger recreation."
  type        = number
}
