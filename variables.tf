variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name used for naming resources"
  type        = string
  default     = "nagham"
}

variable "vpc_cidr" {
  description = "VPC cidr_block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR (AZ 1)"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "Private subnet CIDR"
  type        = string
  default     = "10.0.2.0/24"
}

variable "instance_type" {
  description = "instance_type for ec2 instance"
  type        = string
  default     = "t2.micro"
}

variable "env" {
  description = "Environment for the deployment"
  type        = string
}