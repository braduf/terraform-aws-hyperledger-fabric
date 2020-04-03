provider "aws" {
  version = "~> 2.0"
}

locals {
  tcp_protocol = "tcp"
}

data "aws_ami" "linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }
}

resource "aws_instance" "server" {
  ami           = data.aws_ami.linux.id
  instance_type = var.server_instance_type
  security_groups = [aws_security_group.instance.id]

  tags = {
    Name        = ""
    Environment = var.environment
  }
}

resource "aws_security_group" "instance" {
  name = "${var.server_name}-instance"
}

resource "aws_security_group_rule" "allow_orderer_inbound" {
  type = "ingress"
  security_group_id = aws_security_group.instance.id

  from_port = var.listen_port
  to_port = var.listen_port
  protocol = local.tcp_protocol
  cidr_blocks = var.listen_ingress_cidr_blocks
}

resource "aws_security_group_rule" "allow_operations_inbound" {
  type = "ingress"
  security_group_id = aws_security_group.instance.id

  from_port = var.operations_port
  to_port = var.operations_port
  protocol = local.tcp_protocol
  cidr_blocks = var.operations_ingress_cidr_blocks
}

resource "aws_eip" "public_ip" {
  instance = aws_instance.server.id

  tags = {
    Name        = ""
    NodeType    = "Orderer"
    Environment = var.environment
  }
}

