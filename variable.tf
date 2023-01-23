//REGION
variable "default-region" {
  type = string
}

// VPC
variable "vpc_cidr_block" {
  type = string
}
variable "subnet_cidr_block_a" {
  type = string
}
variable "subnet_cidr_block_b" {
  type = string
}
variable "az" {
  type = map(any)
  default = {
    a = "eu-west-1a"
    b = "eu-west-1b"

  }
}
variable "routetable_cidr_block" {
  type = string
}

//CLUSTER
variable "ecr_name" {
  type = string
}
variable "cluster_name" {
  type = string
}
variable "task_family" {
  type = string
}
variable "container_definitions" {
  type = string
}
variable "task_memory" {
  type = string
}
variable "task_cpu" {
  type = string
}

//IAM
variable "execution_role_name" {
  type = string
}
variable "policy_arn" {
  type = string
}

//SERVICE
variable "service_name" {
  type = string
}
variable "launch_type" {
  type = string
}
variable "desired_count" {
  type = string
}
variable "min_healthy_percent" {
  type = string
}
variable "container_port" {
  type = string
}

//SECURITY GROUP
variable "sg_name" {
  type = string
}

//LOAD BALANCER
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
variable "tg_port" {
  type = string
}

//LISTENER
variable "listener_port" {
  type = string
}