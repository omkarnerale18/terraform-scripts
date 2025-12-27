resource "aws_instance" "example" {
  ami           = "ami-02b8269d5e85954ef"
  instance_type = "t3.micro"

  tags = {
    Name = "terraform-instance"
  }
}