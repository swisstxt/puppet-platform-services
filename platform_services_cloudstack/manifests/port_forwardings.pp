define platform_services_cloudstack::port_forwardings(
  $vip,
) {
  @@cloudstack_port_forwarding{"$::fqdn/tcp/$name":
    ensure => present,
    vip => $vip,
    protocol =>'TCP',
    privateport => $name,
    publicport => $name,
    virtual_machine_id => $::instance_id,
  }
}
