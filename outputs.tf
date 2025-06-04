 output "cluster_name" {
  value = aws_eks_cluster.netflix_eks.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.netflix_eks.endpoint
}

output "kubeconfig_command" {
  value = "aws eks update-kubeconfig --region ${var.region} --name ${aws_eks_cluster.netflix_eks.name}"
}
