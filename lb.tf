resource "ibm_is_lb" "web_lb" {
  name           = "web-lb-dev-rt"
  subnets        = [ibm_is_subnet.z1_private_subnet.id]
  resource_group = data.ibm_resource_group.cde_resource_group.id
  tags           = ["ryantiffany", var.vpc_name]
}

resource "ibm_is_lb_listener" "testacc_lb_listener" {
  lb       = ibm_is_lb.web_lb.id
  port     = "80"
  protocol = "http"
}

resource "ibm_is_lb_pool" "web_pool" {
  name           = "web-pool"
  lb             = ibm_is_lb.web_lb.id
  algorithm      = "round_robin"
  protocol       = "http"
  health_delay   = 60
  health_retries = 5
  health_timeout = 30
  health_type    = "http"
}

resource "ibm_is_lb_pool_member" "testacc_lb_1" {
  lb             = ibm_is_lb.web_lb.id
  pool           = ibm_is_lb_pool.web_pool.id
  port           = 8080
  target_address = ibm_is_instance.web_instances[0].primary_network_interface[0].primary_ipv4_address
  weight         = 60
}

resource "ibm_is_lb_pool_member" "testacc_lb_2" {
  lb             = ibm_is_lb.web_lb.id
  pool           = ibm_is_lb_pool.web_pool.id
  port           = 8080
  target_address = ibm_is_instance.web_instances[1].primary_network_interface[0].primary_ipv4_address
  weight         = 60
}

resource "ibm_is_lb_pool_member" "testacc_lb_3" {
  lb             = ibm_is_lb.web_lb.id
  pool           = ibm_is_lb_pool.web_pool.id
  port           = 8080
  target_address = ibm_is_instance.web_instances[2].primary_network_interface[0].primary_ipv4_address
  weight         = 60
}