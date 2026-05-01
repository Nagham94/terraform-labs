resource "aws_instance" "bastion" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [var.allow_ssh_sg_id]
  associate_public_ip_address = true

  tags = {
    Name = "${var.project_name}_ec2_bastion"
  }
}

resource "aws_instance" "app" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [var.allow_ssh_3000_sg_id]

  tags = {
    Name = "${var.project_name}_ec2_app"
  }
}