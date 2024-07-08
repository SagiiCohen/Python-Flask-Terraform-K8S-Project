			provider "aws" {
			  region = var.region
			}
			module "vpc" {
			  source  = "terraform-aws-modules/vpc/aws"
			  version = "5.9.0"
			  name                 = var.vpc_name
			  cidr                 = var.vpc_cidr
			  azs                  = var.availability_zones
			  private_subnets      = var.private_subnets
			  public_subnets       = var.public_subnets
			  map_public_ip_on_launch = true
			  enable_nat_gateway   = true
			  single_nat_gateway   = true
			  enable_dns_support   = true
			  enable_dns_hostnames = true
			  tags = {
			    Name = var.vpc_name
			  }
			  private_subnet_tags = {
			    Name = format("%s-private", var.vpc_name)
			  }
			  public_subnet_tags = {
			    Name = format("%s-public", var.vpc_name)
			  }
			}
			module "eks_cluster" {
			  source          = "terraform-aws-modules/eks/aws"
			  cluster_name    = var.cluster_name
			  subnet_ids      = module.vpc.public_subnets
			  vpc_id          = module.vpc.vpc_id
			  create_kms_key  = false
			  attach_cluster_encryption_policy = false
			  cluster_endpoint_private_access = false
			  cluster_endpoint_public_access = true
			  cluster_encryption_config = {}
			  access_entries = {
			      devops = {
			        principal_arn     = var.devopsARN
			        policy_associations = {
			          admin = {
			            policy_arn = var.clusterAccessPolicy
			            access_scope = {
			              type       = var.AccessEntityClusterPolicyType
			            }
			          }
			        }
			      }
			  }
			  eks_managed_node_groups = {
			    eks_nodes = {
			      desired_capacity = var.desired_capacity
			      max_capacity     = var.max_size
			      min_capacity     = var.min_size
			      instance_type    = var.node_instance_type
			      subnet_ids       = module.vpc.private_subnets
			    }
			  }
			}