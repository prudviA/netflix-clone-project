resource "aws_eks_cluster" "netflix_eks" {
  name     = "netflix_eks"
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = [ 
      aws_subnet.public_subnet_1.id , 
      aws_subnet.public_subnet_2.id ]

      endpoint_private_access = false
      endpoint_public_access = true
  }
  
tags = {
    Name = "netflix_eks"
  }
}



resource "aws_eks_node_group" "eks_nodes" {
  cluster_name    = aws_eks_cluster.netflix_eks.name
  node_group_name = "node-group"
  node_role_arn   = aws_iam_role.eks_node_role.arn
  subnet_ids      = [
  aws_subnet.public_subnet_1.id,
  aws_subnet.public_subnet_2.id
]

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  instance_types = ["t3.small"]
  disk_size = 20
  depends_on     = [aws_eks_cluster.netflix_eks]

  tags = {
    Name = "node-group"
  }
}
