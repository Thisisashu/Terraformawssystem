resource "aws_security_group" "allow_tls_and_ssh" {
  name        = "allow_tls_and_ssh"
  description = "Allow TLS inbound traffic on port 443, SSH inbound traffic on port 22, and all outbound traffic"
  vpc_id      = "${aws_vpc.main.id}"
  tags = {
    Name = "allow_tls_and_ssh"
  }

dynamic "ingress" { 
    for_each = [443, 80, 22] 
    iterator = port 
    content { 
      from_port = port.value
      to_port   = port.value 
      protocol    = "tcp" 
      cidr_blocks = ["0.0.0.0/0"] 
    } 
  } 

  # Ingress rule for IPv4 (allow TLS on port 443)
#  ingress {
#    from_port   = 443
#    to_port     = 443
#    protocol    = "tcp"
#    cidr_blocks = [aws_vpc.main.cidr_block]
#  }

  # Ingress rule for IPv6 (allow TLS on port 443)
 # ingress {
 #   from_port       = 443
 #   to_port         = 443
 #   protocol        = "tcp"
 #   ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
 # }

  # Ingress rule for IPv4 (allow SSH on port 22)
#  ingress {
#    from_port   = 22
#    to_port     = 22
#    protocol    = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]  # Modify with a specific IP or range if needed
#  }

  # Ingress rule for IPv6 (allow SSH on port 22)
 # ingress {
 #   from_port       = 22
 #   to_port         = 22
 #   protocol        = "tcp"
 #   ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]  # Modify with a specific IP or range if needed
 # }

  # Egress rule for IPv4 (allow all outbound traffic)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress rule for IPv6 (allow all outbound traffic)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # all protocols
    ipv6_cidr_blocks = ["::/0"]
  }
}

