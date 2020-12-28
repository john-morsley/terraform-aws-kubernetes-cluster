#     ____        _               _       
#    / __ \      | |             | |      
#   | |  | |_   _| |_ _ __  _   _| |_ ___ 
#   | |  | | | | | __| '_ \| | | | __/ __|
#   | |__| | |_| | |_| |_) | |_| | |_\__ \
#    \____/ \__,_|\__| .__/ \__,_|\__|___/
#                    | |                  
#                    |_|                  

output "rke_ec2_data" {
  value = var.ec2_data
}

output "export_kubeconfig_command" {
  value = "export KUBECONFIG=k8s/kubeconfig.yaml"
}

output "kubectl_get_nodes_kubeconfig_command" {
  value = "kubectl get no --output=wide --kubeconfig=k8s/kubeconfig.yaml"
}

output "kubectl_get_all_pods_kubeconfig_command" {
  value = "kubectl get po --all-namespaces --output=wide --kubeconfig=k8s/kubeconfig.yaml"
}

output "kubeconfig_yaml" {
  value = rke_cluster.this.kube_config_yaml
}