class platform_services_network::sync {
  network::if::dynamic{'eth2':
    ensure     => 'up',
    peerdns    => 'no',
    macaddress => $::macaddress_eth2,
  }
}
