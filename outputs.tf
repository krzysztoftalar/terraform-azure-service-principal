output "client_secret" {
  description = "Secret password (client_secret) for the Service Principal."
  value       = azuread_application_password.this.value
  sensitive   = true
}

