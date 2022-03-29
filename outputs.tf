output "lb_instance_public_ip" {
  value = aws_instance.lb.public_ip
}