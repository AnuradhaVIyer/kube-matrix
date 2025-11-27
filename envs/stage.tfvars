aws_region        = "ap-south-1"
environment       = "stage"
eks_cluster_name  = "km-eks-stage"
vpc_id            = "vpc-km-stage-aps1"
private_subnet_ids = ["subnet-km-private-aps1a", "subnet-km-private-aps1b"]
public_subnet_ids  = ["subnet-km-public-aps1a", "subnet-km-public-aps1b"]
