class platform_services_cloudstack::port_forwarding::nameserver(
  $vip
) {
  @@cloudstack_port_forwarding{"${vip}_53_53_tcp":
    ensure => present,
    vip => $vip,
    protocol =>'TCP',
    privateport => '53',
    publicport => '53',
    virtual_machine_id => $::instance_id,
  }
  @@cloudstack_port_forwarding{"${vip}_53_53_udp":
    ensure => present,
    vip => $vip,
    protocol =>'UDP',
    privateport => '53',
    publicport => '53',
    virtual_machine_id => $::instance_id,
  }
}
