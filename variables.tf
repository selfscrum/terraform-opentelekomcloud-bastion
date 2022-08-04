variable "stage" {
  type        = string
  description = "Project qualifier for tags an unique resource names"
}

variable "key_name" {
  type        = string
  description = "SSH Key resource name for the bastion host"
}

variable "key_file" {
  type        = string
  description = "Public Key file name for the bastion host"
}

variable "ssh_port" {
  type        = number
  description = "SSH Port of bastion"
  default     = 22
}
variable "access_constraint" {
  type        = string
  description = "CIDR of machines that are allowed to access the bastion"
  default     = "0.0.0.0/0"
}

variable "image_name" {
  type        = string
  description = "Image name for bastion"
}

variable "vcpus" {
  type        = string
  description = "CPUs for bastion"
}

variable "ram" {
  type        = string
  description = "RAM for bastion"
}

variable "public_subnet_id" {
  type        = string
  description = "Public subnet for bastion take-in"
}

variable "init_script" {
  type        = string
  description = "File name of cloud-init script"
}

variable "ssh_user_name" {
  type        = string
  description = "logon account for instantiated image"
}