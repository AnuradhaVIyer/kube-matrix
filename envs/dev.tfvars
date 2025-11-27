aws_region        = "ap-south-1"
environment       = "dev"
eks_cluster_name  = "km-eks-dev"
vpc_id            = "vpc-km-dev-aps1"
private_subnet_ids = ["subnet-km-private-aps1a", "subnet-km-private-aps1b"]
public_subnet_ids  = ["subnet-km-public-aps1a", "subnet-km-public-aps1b"]
