resource "aws_key_pair" "this" {
  key_name   = "Rundeck"
  public_key = file("~/.ssh/id_rsa.pub")
}