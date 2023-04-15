provider "aws" {

    access_key = ""
    secret_key = ""
  region = "ap-south-1"
}

resource "aws_vpc" "epam4325_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "epam4325_subnet" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.epam4325_vpc.id
}

resource "aws_lb" "epam4325_alb" {
  name               = "epam4325-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.epam4325_subnet.id]

  access_logs {
    bucket  = "epam4325-alb-logs"
    prefix  = "epam4325"
    enabled = true
  }
}


resource "aws_launch_configuration" "epam4325_lc" {
  name                 = "11904325"
  image_id             = ""
  instance_type        = "t2.micro"
  security_groups      = [aws_security_group.epam4325_sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello World" > /var/www/html/index.html
              EOF
}

resource "aws_security_group" "epam4325_sg" {
  name_prefix = "epam4325-sg"
  vpc_id      = aws_vpc.epam4325_vpc.id

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


resource "aws_route53_record" "epam4325_record" {
  zone_id = ""
  name    = "epam4325.com"
  type    = "A"

  alias {
    name                   = aws_lb.epam4325_alb.dns_name
    zone_id                = aws_lb.epam4325_alb.zone_id
    evaluate_target_health = true
  }
}