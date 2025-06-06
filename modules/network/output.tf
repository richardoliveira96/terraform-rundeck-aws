output "subnet_pub_1a" {
  value = aws_subnet.eks_subnet_public_1a.id
}

output "subnet_pub_1b" {
  value = aws_subnet.eks_subnet_public_1b.id
}

output "vpc" {
  value = aws_vpc.eks_vpc.id
}