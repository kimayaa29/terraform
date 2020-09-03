resource "aws_vpc" "environment-example" {
  cidr_block = var.cidr-block
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "Prod-VPC"
  }
}

resource "aws_subnet" "public-subnet1" {
  cidr_block = var.public-subnet1-cidr
  vpc_id = "${aws_vpc.environment-example.id}"
  availability_zone = "${var.region}a"

  tags = {
    Name = "Public subnet 1"
  }
}

resource "aws_subnet" "public-subnet2" {
  cidr_block = var.public-subnet2-cidr
  vpc_id = "${aws_vpc.environment-example.id}"
  availability_zone = "${var.region}b"

  tags = {
    Name = "Public subnet 2"
  }
}

resource "aws_subnet" "public-subnet3" {
  cidr_block = var.public-subnet3-cidr
  vpc_id = "${aws_vpc.environment-example.id}"
  availability_zone = "${var.region}c"

  tags = {
    Name = "Public subnet 3"
  }
}

resource "aws_subnet" "private-subnet1" {
  cidr_block = var.private-subnet1-cidr
  vpc_id = "${aws_vpc.environment-example.id}"
  availability_zone = "${var.region}a"

  tags = {
    Name = "Private subnet 1"
  }
}

resource "aws_subnet" "private-subnet2" {
  cidr_block = var.private-subnet2-cidr
  vpc_id = "${aws_vpc.environment-example.id}"
  availability_zone = "${var.region}b"

  tags = {
    Name = "Private subnet 2"
  }
}

resource "aws_subnet" "private-subnet3" {
  cidr_block = var.private-subnet3-cidr
  vpc_id = "${aws_vpc.environment-example.id}"
  availability_zone = "${var.region}c"

  tags = {
    Name = "Private subnet 3"
  }
}

resource "aws_route_table" "public-route-table"{
  vpc_id = "${aws_vpc.environment-example.id}"

  tags = {
    Name = "Public-route-table"
  }
}

resource "aws_route_table" "private-route-table"{
  vpc_id = "${aws_vpc.environment-example.id}"

  tags = {
    Name = "Private-route-table"
  }
}

resource "aws_route_table_association" "public-subnet1-association" {
  route_table_id = aws_route_table.public-route-table.id
  subnet_id = aws_subnet.public-subnet1.id
}

resource "aws_route_table_association" "public-subnet2-association" {
  route_table_id = aws_route_table.public-route-table.id
  subnet_id = aws_subnet.public-subnet2.id
}

resource "aws_route_table_association" "public-subnet3-association" {
  route_table_id = aws_route_table.public-route-table.id
  subnet_id = aws_subnet.public-subnet3.id
}

resource "aws_route_table_association" "private-subnet1-association" {
  route_table_id = aws_route_table.private-route-table.id
  subnet_id = aws_subnet.private-subnet1.id
}

resource "aws_route_table_association" "private-subnet2-association" {
  route_table_id = aws_route_table.private-route-table.id
  subnet_id = aws_subnet.private-subnet2.id
}

resource "aws_route_table_association" "private-subnet3-association" {
  route_table_id = aws_route_table.private-route-table.id
  subnet_id = aws_subnet.private-subnet3.id
}
