variable "env" {
  type = string
}

variable "compartment_ocid" {
  type = string
}

variable "vcn_cidr_block" {
  type = string
}

variable "region" {
  type = string
}

variable "tenancy_ocid" {
  type = string
}

variable "user_ocid" {
  type = string
}

variable "fingerprint" {
  type = string
}

variable "private_key" {
  type      = string
  sensitive = true
}