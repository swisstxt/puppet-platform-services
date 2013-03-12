class platform_services_network::sync {
  if is_ip_address($::ipaddress_eth1) {
    network::interface{'eth1':
      ensure => up,
      bootproto => 'dhcp',
      peerdns => 'no',
      macaddress => $macaddress_eth1,
    }
  }
}
