# =============================================================================
# Data references
# =============================================================================

data aws_caller_identity current {}

data aws_region current {}

# for EC2

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*-x86_64-gp2"]
  }
}