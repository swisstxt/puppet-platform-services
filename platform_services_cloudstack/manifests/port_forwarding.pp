define platform_services_cloudstack::port_forwarding(
  $front_ip,
  $protocol = 'tcp',
  $port = $name
) {
  if $::platform_services::manage_front_ips {
    @@cloudstack_port_forwarding{"$::fqdn/$protocol/$name":
      ensure             => present,
      front_ip           => $front_ip,
      protocol           => $protocol,
      privateport        => $port,
      publicport         => $port,
      virtual_machine_id => $::instance_id,
    }
  }
}
