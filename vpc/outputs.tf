output "resource_group_id" {
    value = data.ibm_resource_group.default.id
}

output "vpc_id" {
    value = ibm_is_vpc.default_rt_vpc.id
}

output "name" {
    value = ibm_is_vpc.default_rt_vpc.name
}

output "region" {
    value = var.region
}