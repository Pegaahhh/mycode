terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "simplegoservice" {
  name         = "registry.gitlab.com/alta3/simplegoservice"
  keep_locally = true      // keep image after "destroy"
}

resource "docker_container" "simplegoservice" {
  image = docker_image.simplegoservice.image_id
  name = var.container_name
  ports {
    # internal and external are now defined by variables
    internal = var.internal_port
    external = var.external_port
  }
}
# updated variables.tf
variable "container_name" {
  description = "Value of the name for the Docker container"
  type        = string
  default     = "AltaResearchWebService"
}

variable "internal_port" {
  description = "Internal port of the container"
  type        = number
  default     = 9876
}

variable "external_port" {
  description = "External port on the container"
  type        = number
  default     = 5432
}
