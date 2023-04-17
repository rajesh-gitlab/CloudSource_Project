provider "aws" {
  access_key = "ACCESS KEY"  # Recommended to add the these values by declaring variable
  secret_key = "SECRET KEY"  # Recommended to add the these values by declaring variable
  region     = "us-east-1"
}

resource "aws_key_pair" "my-pub-key" {
  key_name   = "my-pub-key"
  public_key = file("/root/.ssh/id_rsa.pub")  #This key should be ideally available in desired location
}

resource "aws_instance" "rajeshtokala" {
  ami           = "ami-05c240bc171674508" # Ubuntu 20.04 AMI ID
  instance_type = "t2.micro"
  key_name      = "my-pub-key"
  vpc_security_group_ids = ["${aws_security_group.allow_ssh_https.id}"]
  tags = {
    Name = "rajeshtokala-instance"
  }
}

resource "aws_security_group" "allow_ssh_https" {
  name_prefix = "allow_ssh_https"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
output "public_ip" {
  value = aws_instance.rajeshtokala.public_ip
}
