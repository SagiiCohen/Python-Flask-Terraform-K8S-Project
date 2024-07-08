				variable "region" {
				  description = "The AWS region to deploy resources"
				  type        = string
				}
				variable "vpc_name" {
				  description = "The name of the VPC"
				  type        = string
				}
				variable "vpc_cidr" {
				  description = "The CIDR block for the VPC"
				  type        = string
				}
				variable "availability_zones" {
				  description = "The availability zones to use"
				  type        = list(string)
				}
				variable "private_subnets" {
				  description = "The private subnets CIDR blocks"
				  type        = list(string)
				}
				variable "public_subnets" {
				  description = "The public subnets CIDR blocks"
				  type        = list(string)
				}
				variable "cluster_name" {
				  description = "The name of the EKS cluster"
				  type        = string
				}
				variable "node_instance_type" {
				  description = "The instance type for the worker nodes"
				  type        = list(string)
				}
				variable "desired_capacity" {
				  description = "The desired number of worker nodes"
				  type        = number
				}
				variable "max_size" {
				  description = "The maximum number of worker nodes"
				  type        = number
				}
				variable "min_size" {
				  description = "The minimum number of worker nodes"
				  type        = number
				}
				variable "devopsARN" {
				    description = "The ARN value"
				    type = string
				}
				variable "clusterAccessPolicy" {
				    description = "The value of the access policy"
				    type = string
				}
				variable "AccessEntityClusterPolicyType" {
				    description = "The value of the cluster policy type"
				    type = string
}