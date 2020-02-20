provider "aws" {
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

  tags = {
    Name        = ""
    Environment = var.environment
  }
}

resource "aws_eip" "public_ip" {
  instance = aws_instance.server.id

  tags = {
    Name        = ""
    NodeType    = "Orderer"
    Environment = var.environment
  }
}

