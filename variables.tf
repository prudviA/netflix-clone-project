variable "cluster_name" {}
variable "cluster_role_arn" {}
variable "subnet_ids" {
  type = list(string)
}
variable "node_role_arn" {}
variable "desired_capacity" {}
variable "max_capacity" {}
variable "min_capacity" {}
variable "instance_type" {}



variable "region" {}
variable "cluster_name" {}
variable "desired_capacity" {}
variable "max_capacity" {}
variable "min_capacity" {}
variable "instance_type" {}
