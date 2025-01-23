variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS profile to use for credentials"
  default     = "default"
}

variable "instance_count" {
  description = "Number of EC2 instances to deploy"
  default     = 3
}

variable "instance_type" {
  description = "Type of EC2 instance to deploy"
  default     = "t2.medium"
}

variable "instance_ami" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-0e1bed4f06a3b463d" # Ubuntu Server 22.04 LTS.
}

variable "instance_key_name" {
  description = "Key pair name for the EC2 instance"
  default     = "cka-keypair"
}

variable "instance_subnet_id" {
  description = "Subnet ID for the EC2 instance"
  default     = "subnet-002a34c83222192a7"
}

variable "instance_security_group_id" {
  description = "Security Group ID for the EC2 instance"
  default     = "sg-03bb1a8a21868cd7b"
}

variable "user_data" {
  description = "User data script to run on the EC2 instance"
  default     = null
}

variable "instance_tags" {
  description = "Tags to apply to the EC2 instance"
  default = {
    Name = "Kubernetes instance"
  }
}