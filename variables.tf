variable "network_connectivity_hub_iam_bindings" {
  description = <<EOT
Map of network_connectivity_hub_iam_bindings, attributes below
Required:
    - hub
    - members
    - role
Optional:
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    hub     = string
    members = set(string)
    role    = string
    project = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

