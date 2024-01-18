variable "ami" {
    default = "ami-0c7217cdde317cfec"
    type = string
}

variable "type" {
    default = "t2.micro"
    type = string
}

variable "key-pair" {
    default = "mini-project"
  
}

variable "availability_zone" {
    default = {
        "a" = "us-east-1a"
        "b" = "us-east-1b"
    }
    type = map(any)
}