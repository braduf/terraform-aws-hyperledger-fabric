# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------


# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------
variable "server_name" {
  description = "A name for the EC2 instance to run for the server of the orderer"
  type        = string
  default     = "orderer"
}

variable "server_instance_type" {
  description = "The type of EC2 instance to run for the server of the orderer"
  type        = string
  default     = "t2.micro"
}

variable "environment" {
  description = "The environment the server of the orderer"
  type        = string
  default     = "dev"
}

variable "listen_port" {
  description = "The port the orderer will listen on"
  type = string
  default = "7050"
}

variable "listen_ingress_cidr_blocks" {
  description = "The ip addresses allowed to contact the orderer"
  type = list(string)
  default = ["0.0.0.0/0"]
}

variable "operations_port" {
  description = "The port for the operations server"
  type = string
  default = "8443"
}

variable "operations_ingress_cidr_blocks" {
  description = "The ip addresses allowed to contact the orderer's operations service"
  type = list(string)
  default = ["0.0.0.0/0"]
}
