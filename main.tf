resource "google_network_connectivity_hub_iam_binding" "network_connectivity_hub_iam_bindings" {
  for_each = var.network_connectivity_hub_iam_bindings

  hub     = each.value.hub
  members = each.value.members
  role    = each.value.role
  project = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

