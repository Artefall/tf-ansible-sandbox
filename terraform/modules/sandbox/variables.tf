variable "host_ammount"{
    type = string
    description = "Ammount of hosts in sandbox"
}

variable "instance_type"{
    type = string
    description = "Instance type"
}

variable "ssh_key_name"{
    type = string
    description = "Name of SSH key, that already exists in AWS"
}