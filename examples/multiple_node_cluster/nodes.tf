#      _   _           _        __ 
#     | \ | |         | |      /_ |
#     |  \| | ___   __| | ___   | |
#     | . ` |/ _ \ / _` |/ _ \  | |
#     | |\  | (_) | (_| |  __/  | |
#     |_| \_|\___/ \__,_|\___|  |_|

module "nodes" {

  source = "./../../../terraform-aws-ec2-module"
  #source = "john-morsley/ec2/aws"

  count = var.number_of_nodes

  name = "${var.cluster_name}-node-${count.index}-ec2"

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.ec2_instance_type

  vpc_id = module.vpc.id

  iam_instance_profile_name = module.iam-role.instance_profile_name

  public_subnet_id = module.vpc.public_subnet_ids[0]

  additional_security_group_ids = [
    module.cluster-sg.id,
  ]

  availability_zone = data.aws_availability_zones.available.names[0]

  tags = local.cluster_id_tag

  //bucket_name = local.bucket_name

  docker = true

  //  depends_on = [
  //    module.s3_bucket
  //  ]

}