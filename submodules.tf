module "disks" {
  count            = var.host_count
  source           = "jd4883/vsphere-nested-esxi-disk-parser/vmware"
  disk_path        = var.disk_path
  ssd_datastore    = var.ssd_datastore
  hdd_datastore    = var.hdd_datastore
  index            = count.index + 1
  hdd_size         = var.hdd_size
  ssd_size         = var.ssd_size
  os_size          = var.os_size
  eagerly_scrub    = !var.thin_disk_provisioning
  thin_provisioned = var.thin_disk_provisioning
}

module "vapp" {
  count     = length(module.disks)
  source    = "jd4883/vsphere-nested-esxi-vapp/vmware"
  cidr      = var.cidr
  dns       = var.dns
  domain    = var.domain
  gateway   = var.gateway
  hostname  = "${var.hostname_prefix}${count.index + 1}"
  ip_suffix = count.index + var.ip_start
  password  = var.password
  vlan      = var.vlan
}