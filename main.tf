  
module "tomcat_container" {
  source = "./musicstore"
  password=var.pass
}
module "testing_containers" {
  source = "./testing"
} 
module "awstomcat" {
  source = "./awstomcat"
  access=var.acc
  secret=var.sec
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
output "tomcat_link" {
  value = module.awstomcat.aws_link
}
