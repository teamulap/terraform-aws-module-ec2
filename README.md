# AWS EC2 Terraform Module
This module creates a ready-to-use AWS EC2 Instance.

## Change Log
**v0.0.1**
- Dynamic EC2 Instance Count
- Keypair can be attached automatically
- Startup Script can be attached as "User Data"

## Future plans
1. Review and use the module to reveal other use-cases

## Usage
```hcl
module "ec2" {
    source  = "../../../terraform/modules"
    region  = "ap-northeast-1"
    subnet_id = "subnet-949ec8dd"
    security_group_ids = ["sg-2764355e"]
    nb_instances        = "1"
    instance_type       = "t3.nano"
    instance_set_name   = "terratest-ec2"
    associate_public_ip_address = "true"
    ssh_key_name        = "terratest-my-key"
    ssh_public_key      = "${file("../../test/id_rsa.pub")}"
    ami_id              = "ami-0f310fced6141e627"
    instance_tags       = {
                            name = "Terratest-Ec2-1"
                            project = "Terratest"
                            environment = "development"
                            contact = "jcbagtas"
                            temporary = "true"
                            costCenter = "JC"
                            terraform = "true"
                            managedBy = "jcbagtas"
                        }
}
```
