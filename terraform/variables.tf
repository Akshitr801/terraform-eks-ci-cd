variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "ndj-eks-cluster"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "node_instance_types" {
  description = "EKS worker node instance types"
  type        = list(string)
  default     = ["c7i-flex.large"]
}

variable "jenkins_instance_type" {
  description = "EC2 instance type for Jenkins server"
  type        = string
  default     = "c7i-flex.large"
}

variable "jenkins_public_key_path" {
  description = "Path to public SSH key for Jenkins EC2 access"
  type        = string
  default     = "~/.ssh/jenkins-key.pub"
}

variable "my_ip" {
  description = "Your public IP in CIDR format for SSH/Jenkins access, example: 1.2.3.4/32"
  type        = string
}