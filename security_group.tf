/*
  _____                      _ _            _____                                  
 / ____|                    (_) |          / ____|                                
| (___   ___  ___ _   _ _ __ _| |_ _   _  | |  __ _ __ ___  _   _ _ __   
 \___ \ / _ \/ __| | | | '__| | __| | | | | | |_ | '__/ _ \| | | | '_ \ 
 ____) |  __/ (__| |_| | |  | | |_| |_| | | |__| | | | (_) | |_| | |_) |
|_____/ \___|\___|\__,_|_|  |_|\__|\__, |  \_____|_|  \___/ \__,_| .__/ 
                                    __/ |                        | |                              
                                   |___/                         |_|  
                                                                      */

# Allow Kube API

module "cluster-sg" {

  source = "./../terraform-aws-security-group-module"
  #source = "john-morsley/security-group/aws"

  name        = "${var.cluster_name}-sg"
  description = "Cluster related traffic."

  vpc_id = var.vpc_id

  //  // ingress = [
  //  //   {
  //  //     description = "Allow KupeAPI"
  //  //     from_port   = 6443
  //  //     to_port     = 6443
  //  //     protocol    = "tcp"
  //  //     cidr_blocks = [local.all_cidr_block]
  //  //   }
  //  // ]
  //
  //  // egress = [{
  //  //   description = "Allow All"
  //  //   from_port   = 0
  //  //   to_port     = 0
  //  //   protocol    = "-1"
  //  //   cidr_blocks = [local.all_cidr_block]
  //  // }]

  tags = local.cluster_id_tag

}

# Allow HTTP

//module "allow-http-sg" {
//
//  source = "./../../../terraform-aws-security-group-module"
//  #source = "john-morsley/security-group/aws"
//
//  name        = "allow-http-for-${var.cluster_name}"
//  description = "Allow HTTP."
//
//  vpc_id = module.vpc.id
//
//  tags = local.cluster_id_tag
//
//}

# Allow All

//module "allow-all-sg" {
//
//  source = "./../../../terraform-aws-security-group-module"
//  #source = "john-morsley/security-group/aws"
//
//  name        = "allow-all-for-${var.cluster_name}"
//  description = "Allow All."
//
//  vpc_id = module.vpc.id
//
//  tags = local.cluster_id_tag
//
//}
