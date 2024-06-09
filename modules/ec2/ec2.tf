resource "aws_instance" "rundeck" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.medium"
  availability_zone      = "us-east-1a"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.sg.id]
  key_name               = aws_key_pair.this.key_name

  tags = merge(
    var.tags,
    { Name = "${var.project_name}-ec2" }
  )

}