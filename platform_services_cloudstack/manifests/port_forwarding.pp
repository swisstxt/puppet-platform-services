define platform_services_cloudstack::port_forwarding(
  $front_ip,
  $protocol = 'tcp',
  $port = name
) {
  @@cloudstack_port_forwarding{"$::fqdn/$protocol/$name":
    ensure             => present,
    front_ip                => $front_ip,
    protocol           => upcase($protocol),
    privateport        => $name,
    publicport         => $name,
    virtual_machine_id => $::instance_id,
  }
}
