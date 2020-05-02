# EC2
variable "nb_instances" {
  type        = string
  description = "(Required) Number of instances to spawn."
  default     = "1"
}
variable "instance_set_name" {
  type        = string
  description = "(Required) The Set name for your VM"
}
variable "associate_public_ip_address" {
  type        = string
  description = "(Required) associate_public_ip_address to true or false"
  default     = "true"
}


variable "instance_type" {
  type        = string
  description = "(Required) The type of instance to start. Updates to this field will trigger a stop/start of the EC2 instance."
}

variable "instance_tags" {
  type        = map
  description = "(Required) A map of tags to assign to the resource."
}

variable "ami_id" {
  type        = string
  description = "(Required if ami_filter is not present) The AMI to use for the instance."
  default     = ""
}

variable "region" {
  type        = string
  description = "(Required) The Region you want the resources to be in."
}

variable "ssh_public_key" {
  type        = string
  description = "(Required) The public key material."
  default     = ""
}
variable "ssh_key_name" {
  type        = string
  description = "(Required) The public key name."
  default     = "default-key"
}
variable "user_data" {
  type        = string
  description = "(Optional) The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user_data_base64 instead"
  default     = ""
}

#VPC
variable "subnet_id" {
  type        = string
  description = "(Required) ID of the Subnet from the VPC where the Instance will be spawned"
}
# SG
variable "security_group_ids" {
  type        = list
  description = "(Required) List of Security Group IDs"
}
