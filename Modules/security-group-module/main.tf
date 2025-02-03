module "web_sg" {
  source      = "./aws"
  name        = "web-security-group"
  description = "Security group for web servers"
  vpc_id      = "vpc-039cd2d4730731ef0"

  ingress_rules = [
    {
      ports       = [80, 443]  # Multiple ports for HTTP & HTTPS
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      ports       = [22]  # SSH access
      protocol    = "tcp"
      cidr_blocks = ["192.168.1.0/24"]
    }
  ]

  egress_rules = [
    {
      ports       = [0]  # Allow all outbound
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  tags = {
    Environment = "Production"
    Owner       = "DevOps Team"
  }
}
