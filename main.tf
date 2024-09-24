data "hcp_packer_artifact" "hello-world" {
  bucket_name  = "hello-world"
  channel_name = "latest"
  platform     = "aws"
  region       = "us-east-2"
}

resource "aws_instance" "hello_world" {
  ami             = data.hcp_packer_artifact.hello-world.external_identifier
  instance_type   = var.instance_type
  security_groups = [aws_security_group.web_sg.name]

  tags = {
    Name = var.instance_name
  }
}

resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow inbound traffic to web servers"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
