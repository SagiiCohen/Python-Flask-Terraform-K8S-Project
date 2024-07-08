			region              = "us-east-1"
			vpc_name            = "barkuni-corp-sagi-vpc"
			vpc_cidr            = "10.1.0.0/16"
			availability_zones  = ["us-east-1a", "us-east-1b"]
			private_subnets     = ["10.1.1.0/24", "10.1.2.0/24"]
			public_subnets      = ["10.1.101.0/24", "10.1.102.0/24"]
			cluster_name      = "barkuni-corp-sagi"
			node_instance_type = ["t2.medium"]
			desired_capacity  = 1
			max_size          = 2
			min_size          = 1
			devopsARN = "arn:aws:iam::058264138725:user/devops"
			clusterAccessPolicy = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
			AccessEntityClusterPolicyType = "cluster"
