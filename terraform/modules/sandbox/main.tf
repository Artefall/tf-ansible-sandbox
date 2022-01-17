data "aws_ami" "ubuntu_server_image_latest" {
  owners      = ["099720109477"]
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-21*-amd64-server-*"]
  }
}

resource "aws_instance" "this" {
  count = var.host_ammount

  instance_type = var.instance_type
  ami           = data.aws_ami.ubuntu_server_image_latest.id

  security_groups = [aws_security_group.this.name]

  key_name = var.ssh_key_name

  tags = {
    Name = "Sandbox host ${count.index}" 
  }
}

resource "aws_eip" "this" {
  count = var.host_ammount

  instance = aws_instance.this[count.index].id
  vpc      = false

  tags = {
     Name = "sandbox-eip-${count.index}"
  }
}

resource "aws_security_group" "this" {
  name        = "Allow SSH connections"
  description = "Allow connections for this host"


  dynamic "ingress" {
    for_each = ["22"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Allow SSH"
  }
}