resource "ibm_is_public_gateway" "z1_gateway" {
  name           = "${module.vpc.name}-z1-pubgw"
  resource_group = module.vpc.resource_group_id
  vpc            = module.vpc.vpc_id
  zone           = "${module.vpc.region}-1"
  tags           = ["ryantiffany", module.vpc.region, module.vpc.name]
}

resource "ibm_is_subnet" "vpc_secure_bastion_subnet" {
  name            = "${module.vpc.name}-z1-secure-bastion-subnet"
  resource_group  = module.vpc.resource_group_id
  vpc             = module.vpc.vpc_id
  zone            = "${module.vpc.region}-1"
  ipv4_cidr_block = "10.240.0.0/24"
  public_gateway  = ibm_is_public_gateway.z1_gateway.id
}

resource "ibm_is_subnet" "vpc_secure_private_subnet" {
  name            = "${module.vpc.name}-z1-secure-private-subnet"
  resource_group  = module.vpc.resource_group_id
  vpc             = module.vpc.vpc_id
  zone            = "${module.vpc.region}-1"
  ipv4_cidr_block = "10.240.1.0/24"
  public_gateway  = ibm_is_public_gateway.z1_gateway.id
}
