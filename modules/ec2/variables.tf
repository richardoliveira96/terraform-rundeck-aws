variable "project_name" {
  type        = string
  description = "Project name to be used to name the resources (Name tag)"
}

variable "tags" {
  type        = map(any)
  description = "Tags to be added to AWS Resources"
}

variable "vpc_id" {
  type        = string
  description = "Tags to be added to AWS Resources"
}

variable "subnet_id" {
  type        = string
  description = "Tags to be added to AWS Resources"
}