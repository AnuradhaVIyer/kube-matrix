aws_region        = "ap-south-1"
environment       = "prod"
eks_cluster_name  = "km-eks-prod"
vpc_id            = "vpc-km-prod-aps1"
private_subnet_ids = ["subnet-km-private-aps1a", "subnet-km-private-aps1b"]
public_subnet_ids  = ["subnet-km-public-aps1a", "subnet-km-public-aps1b"]
