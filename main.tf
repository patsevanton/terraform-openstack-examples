resource "openstack_compute_keypair_v2" "my-cloud-key" {
  name       = "my-key"
  public_key = file("/home/user/.ssh/id_rsa.pub")
}
