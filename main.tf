module "tomcat_container" {
  source = "./tomcat_container"
}

 module "testing_containers" {
  source = "./testing_containers"
} 

variable "password" {
  type = string
}
