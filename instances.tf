resource "aws_key_pair" "ssh" {
  key_name   = "olya-ssh-key"
  public_key = var.ssh_key
}

resource "aws_instance" "lb" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.ssh.key_name
  private_ip                  = var.lb_private_ip
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.group.id]
  subnet_id                   = aws_subnet.public.id

  tags = {
    Name = "LB"
  }
}