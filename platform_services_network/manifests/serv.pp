class platform_services_network::serv {
  network::interface{'eth0':
    ensure => 'up',
    bootproto => 'static',
    macaddress => $macaddress_eth0,
  }
}
