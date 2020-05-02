module "ec2" {
  source                      = "../../../terraform/modules"
  region                      = "ap-northeast-1"
  subnet_id                   = "subnet-949ec8dd"
  security_group_ids          = ["sg-2764355e"]
  ami_id                      = "ami-0f310fced6141e627"
  nb_instances                = "1"
  instance_type               = "t3.nano"
  instance_set_name           = "terratest-ec2"
  associate_public_ip_address = "true"
  ssh_key_name                = "terratest-my-key"
  ssh_public_key              = file("../../test/id_rsa.pub")
  instance_tags = {
    name        = "Terratest-EC2-1"
    project     = "Terratest"
    environment = "development"
    contact     = "jcbagtas"
    temporary   = "true"
    costCenter  = "JC"
    terraform   = "true"
    managedBy   = "jcbagtas"
  }
  user_data = file("../../test/user_data.sh")
}