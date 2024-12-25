provider "aws" {
  region = "us-east-1"
  alias  = "east"
}

provider "aws" {
  region = "us-west-2"
  alias  = "west"
}


resource "aws_instance" "east_instance" {
  provider = aws.east
  ami           = "ami-01816d07b1128cd2d"
  instance_type = "t2.micro"
  key_name      = "east_key"

  tags = {
    Name = "East-Instance"
  }
}


resource "aws_instance" "west_instance" {
  provider = aws.west
  ami           = "ami-07d9cf938edb0739b"
  instance_type = "t2.micro"
  key_name      = "west_key"

  tags = {
    Name = "West-Instance"
  }
}

