class platform_services_network::stor {
  network::if::dynamic{'eth1':
    ensure     => 'up',
    peerdns    => 'no',
    macaddress => $::macaddress_eth1,
  }
}
