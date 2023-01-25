//REGION
variable "default-region" {
  type = string
}

// VPC
variable "vpc_id" {
  type = string
  default = null
}

//SECURITY GROUP
variable "sg_name" {
  type = string
}
variable "security_groups" {
  description = "The security groups to attach to the load balancer. e.g. [\"sg-edcd9784\",\"sg-edcd9785\"]"
  type        = list(string)
  default     = []
}

//LOAD BALANCER
variable "subnets" {
  description = "A list of subnets to associate with the load balancer. e.g. ['subnet-1a2b3c4d','subnet-1a2b3c4e','subnet-1a2b3c4f']"
  type        = list(string)
  default     = null
}
variable "lb_name" {
  type = string
}
variable "lb_type" {
  type = string
}
variable "lb_sg_name" {
  type = string
}

//TARGET GROUP
variable "tg_name" {
  type = string
}

//LISTENER
variable "listener_port" {
  type = string
}