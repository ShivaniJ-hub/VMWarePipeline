terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "2.11.0"
    }
  }
}
provider "docker" {

  registry_auth {
    address = "registry.hub.docker.com"
    username = "shivani221"
    password = var.password
  }
}

resource "docker_image" "myimage" {
  name = "shivani221/tomcatserver:latest"
  build {
      path="."
  }
}

variable "password" {
  type = string
}