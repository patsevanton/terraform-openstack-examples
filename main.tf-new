resource "openstack_compute_keypair_v2" "my-cloud-key" {
  name       = "my-key"
  public_key = file("/home/user/.ssh/id_rsa.pub")
}

resource "openstack_compute_instance_v2" "test" {
  count           = 3
  name            = "zookeper-${count.index}"
  image_name      = "CentOS_7.6_CloudImage_201901"
  flavor_name     = "c2.m8.d40"
  key_pair        = openstack_compute_keypair_v2.my-cloud-key.name
  security_groups = ["any-any"]

  network {
    name = var.network
    fixed_ip_v4 = lookup(var.zookeper_ip_v4,count.index)
  }

}
