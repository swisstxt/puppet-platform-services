class platform_services_network::sync {
  if is_ip_address($::ipaddress_eth2) {
    network::interface{'eth2':
      ensure => up,
      bootproto => 'dhcp',
      peerdns => 'no',
      macaddress => $macaddress_eth2,
    }
  }
}
