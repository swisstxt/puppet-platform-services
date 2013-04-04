class platform_services_network::sync {
  network::if::dynamic{'eth2':
    ensure     => 'up',
    peerdns    => false,
    macaddress => $::macaddress_eth2,
  }
}
