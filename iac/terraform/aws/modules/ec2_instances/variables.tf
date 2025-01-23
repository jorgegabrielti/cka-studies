variable "instance_type" {
  description = "Type of EC2 instances"
  type = string
}

variable "instance_ami" {
  description = "AMI ID for the EC2 instances"
  type = string
}

variable "instance_key_name" {
  description = "Key pair name to use for EC2 instances"
  type = string
}

variable "instance_security_group_id" {
  description = "List of security group IDs"
  type = list(string)
}
variable "instance_subnet_id"{
  description = "The ID of the subnet"
  type = string
}

variable "user_data" {
  description = "User data script to run on the EC2 instances"
  type = string
}

variable "tags" {
  description = "Tags for EC2 instances"
  type = map(string)
}