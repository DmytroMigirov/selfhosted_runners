locals {
  image_id      = "ami-0e001c9271cf7f3b9"
  instance_type = "t2.medium"
}

module "asg" {
  source = "terraform-aws-modules/autoscaling/aws"

  name = "${var.name}-asg"

  image_id        = local.image_id
  instance_type   = local.instance_type
  key_name        = var.key_name
  security_groups = [module.security_group.security_group_id]
  user_data       = filebase64("install_runner_ubuntu.sh")

  update_default_version = true

  vpc_zone_identifier   = module.vpc.public_subnets
  health_check_type     = "EC2"
  min_size              = 0
  max_size              = 0
  desired_capacity      = 0
  protect_from_scale_in = true
}
