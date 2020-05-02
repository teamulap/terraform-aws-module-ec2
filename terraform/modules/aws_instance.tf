resource "aws_instance" "ec2" {
  count                       = var.nb_instances
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.ssh_public_key == "" ? var.ssh_key_name : element(aws_key_pair.default.*.key_name, count.index)
  tags                        = var.instance_tags
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids      = var.security_group_ids
  subnet_id                   = var.subnet_id
  user_data                   = var.user_data
}
