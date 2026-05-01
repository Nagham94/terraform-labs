output "allow_ssh_sg_id" {
  value = aws_security_group.allow_ssh.id
}

output "allow_ssh_3000_sg_id" {
  value = aws_security_group.allow_ssh_3000.id
}