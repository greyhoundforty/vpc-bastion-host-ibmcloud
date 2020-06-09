resource "ibm_is_lb" "web_lb" {
  name           = "${var.vpc_name}-web-loadbalancer"
  subnets        = [ibm_is_subnet.vpc_secure_private_subnet.id]
  resource_group = data.ibm_resource_group.default.id
  tags           = ["ryantiffany", var.vpc_name]
}

resource "ibm_is_lb_listener" "web_lb_listener" {
  depends_on   = [ibm_is_lb.web_lb]
  lb           = ibm_is_lb.web_lb.id
  default_pool = ibm_is_lb_pool.web_pool.id
  port         = "80"
  protocol     = "http"
}

resource "ibm_is_lb_pool" "web_pool" {
  depends_on     = [ibm_is_lb.web_lb]
  name           = "${var.vpc_name}-web-lb-pool"
  lb             = ibm_is_lb.web_lb.id
  algorithm      = "round_robin"
  protocol       = "http"
  health_delay   = 60
  health_retries = 5
  health_timeout = 30
  health_type    = "http"
}

resource "ibm_is_lb_pool_member" "web_lb_member1" {
  depends_on = [ibm_is_lb_pool.web_pool]
  lb         = ibm_is_lb.web_lb.id

  port           = 80
  target_address = ibm_is_instance.web_instances[0].primary_network_interface[0].primary_ipv4_address
  weight         = 60
}

resource "ibm_is_lb_pool_member" "web_lb_member2" {
  depends_on     = [ibm_is_lb_pool.web_pool]
  lb             = ibm_is_lb.web_lb.id
  pool           = ibm_is_lb_pool.web_pool.id
  port           = 80
  target_address = ibm_is_instance.web_instances[1].primary_network_interface[0].primary_ipv4_address
  weight         = 60
}

resource "ibm_is_lb_pool_member" "web_lb_member3" {
  depends_on     = [ibm_is_lb_pool.web_pool]
  lb             = ibm_is_lb.web_lb.id
  pool           = ibm_is_lb_pool.web_pool.id
  port           = 80
  target_address = ibm_is_instance.web_instances[2].primary_network_interface[0].primary_ipv4_address
  weight         = 60
}