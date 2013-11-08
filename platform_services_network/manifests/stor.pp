class platform_services_network::stor {
  network_config{'eth1':
    ensure     => 'present',
    family     => 'inet',
    method     => 'dhcp',
  }
}
