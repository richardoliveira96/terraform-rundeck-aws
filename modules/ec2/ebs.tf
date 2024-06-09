resource "aws_ebs_volume" "this" {
  availability_zone = "us-east-1a"
  size              = 20

  tags = merge(
    var.tags,
    { Name = "${var.project_name}-ebs" }
  )

}

resource "aws_volume_attachment" "this" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.this.id
  instance_id = aws_instance.rundeck.id
}