data "aws_availability_zones" "available" {}

resource "aws_vpc" "eks_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "eks_subnet" {
  count             = 2
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = cidrsubnet("10.0.0.0/16", 4, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    "Name" = "eks-subnet-${count.index}"
  }
}
