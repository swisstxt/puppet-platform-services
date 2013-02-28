class platform_services_cloudstack::port_forwarding::puppetmaster(
  $vip
) {
  @@cloudstack_port_forwarding{"${vip}_8140_8140_tcp":
    ensure => present,
    vip => $vip,
    protocol => 'TCP',
    privateport => '8140',
    publicport => '8140',
    virtual_machine_id => $::instance_id,
  }
}
