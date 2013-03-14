define platform_services_cloudstack::port_forwarding(
  $vip,
  $protocol = 'tcp',
) {
  @@cloudstack_port_forwarding{"$::fqdn/$protocol/$name":
    ensure             => present,
    vip                => $vip,
    protocol           => upcase($protocol),
    privateport        => $name,
    publicport         => $name,
    virtual_machine_id => $::instance_id,
  }
}
