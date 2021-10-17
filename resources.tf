resource "vsphere_virtual_machine" "vm" {
  provisioner "remote-exec" {
    script = "${path.module}/set-esxi-host.sh"
  }
  connection {
    type     = "ssh"
    user     = var.user
    password = self.vapp[count.index].properties["guestinfo.password"]
    host     = self.vapp[count.index].properties["guestinfo.hostname"]
  }
  annotation                       = var.annotation
  boot_delay                       = var.boot_delay
  boot_retry_enabled               = var.boot_retry_enabled
  count                            = var.host_count
  custom_attributes                = var.custom_attributes
  datastore_id                     = var.datastore_id
  efi_secure_boot_enabled          = var.efi_secure_boot_enabled
  enable_disk_uuid                 = var.enable_disk_uuid
  enable_logging                   = var.enable_logging
  extra_config                     = var.extra_config
  firmware                         = var.firmware
  guest_id                         = var.guest_id
  host_system_id                   = var.host_system_id
  memory                           = var.memory
  memory_reservation               = var.memory_reservation
  memory_share_count               = var.memory
  name                             = "${var.hostname_prefix}${count.index + 1}"
  nested_hv_enabled                = var.nested_hv_enabled
  num_cores_per_socket             = ceil(var.cpu_cores * 0.5)
  num_cpus                         = var.cpu_cores
  pci_device_id                    = var.pci_device_id
  resource_pool_id                 = var.resource_pool_id
  sync_time_with_host              = var.sync_time_with_host
  sync_time_with_host_periodically = var.sync_time_with_host_periodically
  tags                             = var.tags
  vvtd_enabled                     = var.vvtd_enabled
  wait_for_guest_ip_timeout        = var.timeouts
  wait_for_guest_net_routable      = var.wait_for_guest_net_routable
  wait_for_guest_net_timeout       = var.timeouts
  clone {
    template_uuid = var.template_uuid
    timeout       = var.clone_timeout
  }

  dynamic "network_interface" {
    for_each = range(var.network_interfaces)
    content {
      network_id = var.network_id
    }
  }

  vapp { properties = module.vapp[count.index].vapp }

  dynamic "disk" {
    for_each = flatten(module.disks[count.index].disks)
    content {
      attach            = disk.value.attach
      controller_type   = disk.value.controller_type
      datastore_id      = disk.value.datastore_id
      disk_mode         = disk.value.disk_mode
      eagerly_scrub     = disk.value.eagerly_scrub
      io_limit          = disk.value.io_limit
      io_reservation    = disk.value.io_reservation
      io_share_count    = disk.value.io_share_count
      io_share_level    = disk.value.io_share_level
      keep_on_remove    = disk.value.keep_on_remove
      label             = disk.value.label
      path              = disk.value.path
      size              = disk.value.size
      storage_policy_id = disk.value.storage_policy_id
      write_through     = disk.value.write_through
      thin_provisioned  = disk.value.thin_provisioned
      unit_number       = disk.value.unit_number
    }
  }

  lifecycle {
    ignore_changes = [
      disk.0.eagerly_scrub,
      disk.1.eagerly_scrub,
      disk.2.eagerly_scrub,
      memory_share_count,
      vapp.0.properties["guestinfo.createvmfs"],
      vapp.0.properties["guestinfo.password"],
      vapp.0.properties["guestinfo.ssh"],
      vapp.0.properties["guestinfo.ssh_key"],
      vapp.0.properties["guestinfo.syslog"],
    ]
  }
}
