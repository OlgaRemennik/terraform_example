output "lb_instance_public_ip" {
  value = aws_instance.lb.public_ip
}

output "web_instance_public_ip" {
  value = aws_instance.web.public_ip
}

output "db_instance_public_ip" {
  value = aws_instance.db.public_ip
}