variable "aws_region" {
  type        = string
  description = "The region to deploy to"
  default     = "us-east-1"
}

variable "repository" {
  type = string
  default = "Alves0611/devops-rocketseat"
}