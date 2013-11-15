class platform_services_network::serv (
  $options = {},
) {
  network_config{'eth0':
    ensure     => 'present',
    family     => 'inet',
    method     => 'dhcp',
    onboot     => 'true',
    options    => $options,
  }
}
