class platform_services_network::stor {
  network::if::dynamic{'eth2':
    ensure     => 'up',
    macaddress => $::macaddress_eth2,
  }
}
