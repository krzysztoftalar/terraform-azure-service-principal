variable "owner" {
  type        = string
  description = "(Required) Company to which the projects belong."
}

variable "project" {
  type        = string
  description = "(Required) The name of the project."
}

variable "environment" {
  type        = string
  description = "(Required) The name of the environment."
}

variable "management" {
  type        = string
  description = "(Required) A description of how this resource is managed, such as `Terraform Cloud - Local`, `Terraform Cloud - Remote`."
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
  type        = list(object({
    scope                = string
    role_definition_name = string
  }))
}

variable "service_principal_description" {
  description = "(Required) A description of the service principal provided for internal end-users."
  type        = string
}

variable "password_end_date" {
  description = "(Optional) The relative duration or RFC3339 rotation timestamp after which the password expire. Defaults to the current time."
  type        = string
  default     = null
}

variable "password_rotation_in_years" {
  description = "(Optional) Number of years to add to the base timestamp to configure the password rotation timestamp. Defaults to null."
  type        = number
  default     = null
}

variable "password_rotation_in_days" {
  description = "(Optional) Number of days to add to the base timestamp to configure the rotation timestamp. When the current time has passed the rotation timestamp, the resource will trigger recreation. Defaults to 180 days."
  type        = number
  default     = 180
}

variable "tags" {
  description = "(Required) A mapping of tags to assign to the resource."
  type        = map(string)
}
