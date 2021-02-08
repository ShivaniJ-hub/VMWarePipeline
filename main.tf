  
module "tomcat_container" {
  source = "./musicstore"
  password=var.pass
}
module "testing_containers" {
  source = "./testing"
} 
module "awstomcat" {
  source = "./awstomcat"
  sshkey=var.ssh
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
variable "ssh" {
  type = string
  default = "sshkey"
}
