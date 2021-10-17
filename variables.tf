variable "cidr" { type = string }
variable "cpu_cores" { type = number }
variable "datastore_id" { type = string }
variable "dns" {}
variable "domain" { type = string }
variable "gateway" {}
variable "hdd_datastore" { type = string }
variable "hdd_size" { type = number }
variable "host_system_id" { type = string }
variable "memory" { type = number }
variable "network_id" { type = string }
variable "network_interfaces" { type = number }
variable "os_size" { type = number }
variable "password" { type = string }
variable "resource_pool_id" { type = string }
variable "ssd_datastore" { type = string }
variable "ssd_size" { type = number }
variable "template_uuid" { type = string }
variable "timeouts" { type = number }

variable "annotation" {
  type    = string
  default = "Nested ESXi 7.0.2 Appliance (Build 17867351) www.williamlam.com"
}

variable "boot_delay" {
  type    = number
  default = 0
}

variable "boot_retry_enabled" {
  type    = bool
  default = true
}

variable "efi_secure_boot_enabled" {
  type    = bool
  default = false
}

variable "enable_disk_uuid" {
  type    = bool
  default = true
}

variable "enable_logging" {
  type    = bool
  default = true
}

variable "extra_config" {
  type    = map(string)
  default = {}
}

variable "firmware" {
  type    = string
  default = "efi"
}

variable "guest_id" {
  type    = string
  default = "vmkernel65Guest"
}

variable "memory_reservation" {
  type    = number
  default = 0
}

variable "nested_hv_enabled" {
  type    = bool
  default = true
}

variable "pci_device_id" {
  type    = list(string)
  default = []
}

variable "sync_time_with_host" {
  type    = bool
  default = true
}

variable "sync_time_with_host_periodically" {
  type    = bool
  default = true
}

variable "tags" {
  type    = list(string)
  default = []
}

variable "vvtd_enabled" {
  type    = bool
  default = true
}

variable "wait_for_guest_net_routable" {
  type    = bool
  default = false
}

variable "clone_timeout" {
  type    = number
  default = 500
}

variable "user" {
  type    = string
  default = "root"
}

variable "custom_attributes" {
  type    = map(string)
  default = {}
}

variable "disk_path" {
  type    = string
  default = "vESXI/vSAN"
}

variable "host_count" {
  type    = number
  default = 4
}

variable "hostname_prefix" {
  type    = string
  default = "vesxi"
}

variable "ip_start" {
  type    = number
  default = 1
}

variable "vlan" {
  type    = number
  default = 0
}

variable "thin_disk_provisioning" {
  type    = bool
  default = true
}