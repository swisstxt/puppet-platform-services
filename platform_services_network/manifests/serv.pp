class platform_services_network::serv {
  network::if::dynamic{'eth0':
    ensure     => 'up',
    peerdns    => false,
    macaddress => $::macaddress_eth0,
  }
}
