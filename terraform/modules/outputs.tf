output "ec2_ids" {
  value = aws_instance.ec2.*.id
}
