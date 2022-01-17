module "sandbox" {
    source = "./modules/sandbox"

    host_ammount = 2
    instance_type = "t2.micro"
    ssh_key_name = "sandbox"

}