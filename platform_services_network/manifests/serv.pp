class platform_services_network::serv {
  network_config{'eth0':
    ensure     => 'present',
    family     => 'inet',
    method     => 'dhcp',
    onboot     => 'true',
  }
}
