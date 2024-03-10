provider "proxmox" {
  pm_api_url = var.proxmox_url
  pm_api_token_id = var.proxmox_api_key_id
  pm_api_token_secret = var.proxmox_api_key_secret
  pm_tls_insecure = true

  pm_log_enable = true
  pm_log_file   = "terraform-plugin-proxmox.log"
  pm_debug      = true
}

provider "talos" {
}

provider "kubectl" {
  host                   = data.talos_cluster_kubeconfig.this.kubernetes_client_configuration.host
  cluster_ca_certificate = base64decode(data.talos_cluster_kubeconfig.this.kubernetes_client_configuration.ca_certificate)
  client_certificate     = base64decode(data.talos_cluster_kubeconfig.this.kubernetes_client_configuration.client_certificate)
  client_key             = base64decode(data.talos_cluster_kubeconfig.this.kubernetes_client_configuration.client_key)
  load_config_file       = false
}