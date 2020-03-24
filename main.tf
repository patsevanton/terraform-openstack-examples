resource "openstack_compute_keypair_v2" "my-cloud-key" {
  name       = "my-key"
  public_key = file("/home/user/.ssh/id_rsa.pub")
}

resource "openstack_compute_instance_v2" "test" {
  name            = "test-vm"
  image_name      = "CentOS_7.6_CloudImage_201901"
  flavor_name     = "c1.m1.d40"
  key_pair        = "${openstack_compute_keypair_v2.my-cloud-key.name}"
  security_groups = ["default"]

  network {
    name = "public"
  }
}

