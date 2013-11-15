class platform_services_network::stor (
  $options = {},
) {
  network_config{'eth1':
    ensure     => 'present',
    family     => 'inet',
    method     => 'dhcp',
    options    => $options,
  }
}
