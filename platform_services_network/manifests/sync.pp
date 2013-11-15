class platform_services_network::sync (
  $options = {},
) {
  network_config{'eth2':
    ensure     => 'present',
    family     => 'inet',
    method     => 'dhcp',
    options    => $options,
  }
}
