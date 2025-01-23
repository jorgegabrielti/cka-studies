terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}


module "ec2_instances_master" {
  source                     = "./modules/ec2_instances"
  instance_type              = var.instance_type
  instance_subnet_id         = var.instance_subnet_id
  instance_security_group_id = var.instance_security_group_id
  instance_ami               = var.instance_ami
  instance_key_name          = var.instance_key_name
  user_data                  = file("./modules/ec2_instances/userDataMaster.sh")
  tags = merge(var.instance_tags, {
    Name = "${var.instance_tags.Name}-master"
  })
}


module "ec2_instances_worker" {
  source                     = "./modules/ec2_instances"
  instance_type              = var.instance_type
  instance_subnet_id         = var.instance_subnet_id
  instance_security_group_id = var.instance_security_group_id
  instance_ami               = var.instance_ami
  instance_key_name          = var.instance_key_name
  user_data                  = file("./modules/ec2_instances/userDataWorker.sh")
  tags = merge(var.instance_tags, {
    Name = "${var.instance_tags.Name}-worker"
  })
}