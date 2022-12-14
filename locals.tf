locals {
  tags = toset([var.owner, var.project, var.environment, var.management])
}
