resource "aws_security_group" "this" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = flatten([
      for rule in var.ingress_rules : [
        for port in rule.ports : {
          from_port      = port
          to_port        = port
          protocol       = rule.protocol
          cidr_blocks    = lookup(rule, "cidr_blocks", [])
          ipv6_cidr_blocks = lookup(rule, "ipv6_cidr_blocks", [])
          security_groups = lookup(rule, "security_groups", [])
          self           = lookup(rule, "self", false)
        }
      ]
    ])
    content {
      from_port      = ingress.value["from_port"]
      to_port        = ingress.value["to_port"]
      protocol       = ingress.value["protocol"]
      cidr_blocks    = ingress.value["cidr_blocks"]
      ipv6_cidr_blocks = ingress.value["ipv6_cidr_blocks"]
      security_groups = ingress.value["security_groups"]
      self           = ingress.value["self"]
    }
  }

  dynamic "egress" {
    for_each = flatten([
      for rule in var.egress_rules : [
        for port in rule.ports : {
          from_port      = port
          to_port        = port
          protocol       = rule.protocol
          cidr_blocks    = lookup(rule, "cidr_blocks", ["0.0.0.0/0"])
          ipv6_cidr_blocks = lookup(rule, "ipv6_cidr_blocks", ["::/0"])
          security_groups = lookup(rule, "security_groups", [])
          self           = lookup(rule, "self", false)
        }
      ]
    ])
    content {
      from_port      = egress.value["from_port"]
      to_port        = egress.value["to_port"]
      protocol       = egress.value["protocol"]
      cidr_blocks    = egress.value["cidr_blocks"]
      ipv6_cidr_blocks = egress.value["ipv6_cidr_blocks"]
      security_groups = egress.value["security_groups"]
      self           = egress.value["self"]
    }
  }

  tags = var.tags
}
