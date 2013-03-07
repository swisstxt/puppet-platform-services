class platform_services_cloudstack::port_forwarding::http(
  $vip
) {
  @@cloudstack_port_forwarding{"${vip}_80_80_tcp":
    ensure => present,
    vip => $vip,
    protocol => 'TCP',
    privateport => '80',
    publicport => '80',
    virtual_machine_id => $::instance_id,
  }
}
