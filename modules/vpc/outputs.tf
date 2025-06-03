output "subnet_ids" {
  value = aws_subnet.eks_subnet[*].id
}

output "vpc_id" {
  value = aws_vpc.eks_vpc.id
}
