variable "availability_zone" {
  type    = string
  default = "ap-south-1a"
}

variable "vpc_cidr_block" {
  type    = string
  default = "192.168.0.0/16"
}

variable "public_subnet_cidr_block" {
  type    = string
  default = "192.168.0.0/24"
}

variable "lb_private_ip" {
  type    = string
  default = "192.168.0.11"
}

variable "web_private_ip" {
  type    = string
  default = "192.168.0.12"
}

variable "db_private_ip" {
  type    = string
  default = "192.168.0.13"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ssh_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDqXC4AcJXlO43iE4jsSu5xIxjsLnQj/cOALTpITvaVboi9BvSQGLT+y0WGdJHfZ/2SQUiIYVTg0a97rBk7ImZ4u7LhagaXwW+mWcOpidKhgbKST482JW2IWLINpUZOyr5LrIKvHBjfI3j/oPvx2n/X7tNgn2EbT3d9Ovqj+miBCrRkZUzTbhN7pp5aD2nZlhGw24yNEkAn7tjufqnWFv8iXGyWiHEwfrfcUseQIKk4YhZkOOTVJ0sRon0GnWGn5lj61BCIyAOk+O+/9WLmnu509ZNwD3wLu/CQTWcoxCeXHnOZTCUXPkTYIlIiWOwqZNNZO7mdXwiPQYpQN7MUmMJnBOwyQ0Muo0SoIsQpJ9iu4sKV+ybhk8Z1ccK/1TFQ1LTsQp86nuP/3tb8ofgsVY1mXhRddCvfwpi3si1TbMveep6w+bOPdbZza6lyLhaj7i9sh1BCjf/Ut2FXOEKbT84rRTlOXXJYdvvxMDgwlyUGJwYDk8T+V7VcshDvqceGjoc="
}

variable "ansible_roles" {
  type    = string
  default = "roles"
}