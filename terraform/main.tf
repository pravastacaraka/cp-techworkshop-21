provider "google" {
  project     = "tkpd-stag-cloud-workshop-27c9"
  region      = "asia-southeast1"
  zone        = "asia-southeast1-a"
  credentials = "/etc/service-account.json"
}

module "instance" {
  source = "./modules/gcp/instance"

  ci_name              = "mymachine-raka-1"
  ci_machine_type      = "n2-standard-2"
  ci_boot_image_family = "packer-raka-workshopmachine-ubuntu-2004"
  ci_boot_disk_size    = 20
  ci_tags              = ["mymachine-raka-1"]

  ci_firewall_allow_ports = [{
    name     = "allow-http"
    ports    = ["80"]
    protocol = "tcp"
    }, {
    name     = "allow-8080"
    ports    = ["8080"]
    protocol = "tcp"
  }]
}
