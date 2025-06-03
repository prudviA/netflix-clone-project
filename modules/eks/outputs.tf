
output "cluster_name" {
  value = aws_eks_cluster.eks.name
}

output "endpoint" {
  value = aws_eks_cluster.eks.endpoint
}

output "certificate_authority" {
  value = aws_eks_cluster.eks.certificate_authority["data"]
}
