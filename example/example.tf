provider "google" {
  project = "slovink-hyperscaler"
  region  = "asia-northeast1"
  zone    = "asia-northeast1-a"
}

#####==============================================================================
##### vpc module call.
#####==============================================================================
module "vpc" {
  source                                    = "git::https://github.com/slovink/terraform-google-network.git?ref=1.0.0"
  name                                      = "ops"
  environment                               = "test"
  routing_mode                              = "REGIONAL"
  network_firewall_policy_enforcement_order = "AFTER_CLASSIC_FIREWALL"
}

#####==============================================================================
##### subnet module call.
#####==============================================================================
module "subnet" {
  source        = "git::https://github.com/slovink/terraform-google-subnets.git?ref=feature/precommit-134"
  name          = "ops"
  environment   = "test"
  subnet_names  = ["subnet-ops"]
  network       = module.vpc.vpc_id
  ip_cidr_range = ["10.10.1.0/24"]
}

#####==============================================================================
##### firewall module call.
#####==============================================================================
module "firewall" {
  source        = "git::https://github.com/slovink/terraform-google-firewall.git?ref=v1.0.0"
  name          = "ops"
  environment   = "test"
  network       = module.vpc.self_link
  source_ranges = ["0.0.0.0/0"]

  allow = [
    { protocol = "tcp"
      ports    = ["22", "80"]
    }
  ]
}

#####==============================================================================
##### compute_instance module call.
#####==============================================================================
module "compute_instance" {
  source                 = "../"
  name                   = "app"
  environment            = "test"
  instance_count         = 1
  zone                   = "asia-northeast1-a"
  instance_tags          = ["foo", "bar"]
  machine_type           = "e2-small"
  image                  = "ubuntu-2204-jammy-v20230908"
  service_account_scopes = ["cloud-platform"]
  subnetwork             = module.subnet.subnet_id
  network                = module.vpc.vpc_id

  enable_public_ip = true # Enable public IP only if enable_public_ip is true
  metadata = {
    ssh-keys = <<EOF
      ssh-rsa AAAAB3NzaC1yc2EAAAADXODCWBO6Vtu7yegtkUEgTjk5gQ== krishan.yadav@slovink.com
    EOF
  }
}