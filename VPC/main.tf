# Creating VPC

resource "aws_vpc" "vpc-01" {
  cidr_block       = "10.0.0.0/24"
  instance_tenancy = "default"

  tags = {
    Name = "vpc-01"
  }
}

# Creating  public subnet

resource "aws_subnet" "public-sn-01"{
  vpc_id     = aws_vpc.vpc-01.id
  cidr_block = "10.0.0.0/25"

  tags = {
    Name = "public-sn-01"
  }
}

# Creating private subnet

resource "aws_subnet" "private-sn-01"{
  vpc_id     = aws_vpc.vpc-01.id
  cidr_block = "10.0.0.128/25"

  tags = {
    Name = "private-sn-01"
  }
}

# Creating IGW

resource "aws_internet_gateway" "igw-01" {
  vpc_id = aws_vpc.vpc-01.id

  tags = {
    Name = "igw-01"
  }
}

# Creating public RT

resource "aws_route_table" "pub-rt-01" {
  vpc_id = aws_vpc.vpc-01.id

  route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw-01.id
  }

  tags = {
    Name = "pub-rt-01"
  }
}

# Creating private RT

resource "aws_route_table" "priv-rt-01" {
  vpc_id = aws_vpc.vpc-01.id

 

  tags = {
    Name = "priv-rt-01"
  }
}

# Associate public-rt with public sn

resource "aws_route_table_association" "pub-rt-ass" {
  subnet_id      = aws_subnet.public-sn-01.id
  route_table_id = aws_route_table.pub-rt-01.id
}


# Associate private-rt with private sn

resource "aws_route_table_association" "pri-rt-ass" {
  subnet_id      = aws_subnet.private-sn-01.id
  route_table_id = aws_route_table.priv-rt-01.id
}