#      _                     _     
#     | |                   | |    
#     | |     ___   ___ __ _| |___ 
#     | |    / _ \ / __/ _` | / __|
#     | |___| (_) | (_| (_| | \__ \
#     |______\___/ \___\__,_|_|___/

locals {

  all_cidr_block = "0.0.0.0/0" # All possible IP address range
  
  bucket_name = "${var.name}-${random_pet.this.id}"

  name = "multiple-node-example"

  cluster_id_tag = {
    "kubernetes.io/cluster/${local.name}" = "owned" 
  }
  
  node_1_name = "${var.ec2_name}-1"
  node_2_name = "${var.ec2_name}-2"
  
}