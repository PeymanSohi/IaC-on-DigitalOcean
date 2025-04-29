variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
  sensitive   = true
}

variable "ssh_key_name" {
  description = "Name of SSH key uploaded in DigitalOcean"
  type        = string
}

variable "ssh_public_key" {
  description = "Path to your public key"
  type        = string
}

variable "region" {
  default     = "nyc3"
  description = "Region to deploy Droplet"
}

variable "size" {
  default     = "s-1vcpu-1gb"
  description = "Droplet size"
}

variable "image" {
  default     = "ubuntu-22-04-x64"
  description = "Droplet image"
}
