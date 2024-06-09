resource "aws_eip" "this" {
  vpc = true
  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-eip"
    }
  )
}

resource "aws_eip_association" "this" {
  instance_id   = aws_instance.rundeck.id
  allocation_id = aws_eip.this.id
}