aws_profile                = "default"
instance_count             = 3
instance_type              = "t2.medium"
instance_ami               = "ami-0e1bed4f06a3b463d"
instance_key_name          = "cka-keypair"
instance_subnet_id         = "subnet-002a34c83222192a7"
instance_security_group_id = ["sg-03bb1a8a21868cd7b"]
instance_tags = {
  Name        = "Kubernetes instance"
  Environment = "Development"
}
