data "aws_ami" "image" {
  most_recent      = true
  owners           = ["self"]

  filter {
    name   = "name"
    values = ["${var.project_name}-${var.project_env}-*"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "tag:project"
    values = ["${var.project_name}"]
  }
  
  filter {
    name   = "tag:env"
    values = ["${var.project_env}"]
  }  
}

data "aws_route53_zone" "rootdomain" {
  name         = var.hostname_domain_name
  private_zone = false
}
