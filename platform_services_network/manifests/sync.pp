class platform_services_network::sync {
  network_config{'eth2':
    ensure     => 'present',
    family     => 'inet',
    method     => 'dhcp',
    options    => { 'PEERDNS' => 'no' },
  }
}
