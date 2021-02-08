  
module "tomcat_container" {
  source = "./musicstore"
  password=var.pass
}

module "testing_containers" {
  source = "./testing"
} 
   
module "awstomcat" {
  source = "./awstomcat"
} 
  
variable "pass" {
  type = string
  default = "password"
}
variable "acc" {
  type = string
  default = "access-key"
}
variable "sec" {
  type = string
  default = "secret-key"
}
