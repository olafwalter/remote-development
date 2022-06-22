

################################################################################
# Supporting Resources
################################################################################


module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = local.name
  description = "Security group for example usage with EC2 instance"
  vpc_id      = module.this_vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "all-icmp"]
  egress_rules        = ["all-all"]

  tags = local.common_tags
}

resource "aws_placement_group" "web" {
  name     = local.name
  strategy = "cluster"
}

resource "aws_kms_key" "this" {
}

resource "aws_network_interface" "this" {
  subnet_id = element(module.this_vpc.private_subnets, 0)
}

################################################################################
# EC2 Module
################################################################################

module "cromwell" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "${local.name}-cromwell"

  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t3.xlarge"
  # cpu_credits                 = "unlimited"
  subnet_id                   = element(module.this_vpc.private_subnets, 0)
  vpc_security_group_ids      = [module.security_group.security_group_id]
  associate_public_ip_address = false
  iam_instance_profile = "mon-default-instance-profile" # for cloudops

  tags = local.common_tags
}

