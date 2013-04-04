class platform_services_network {
  augeas{'sysconfig/network hostname':
    changes => "set /files/etc/sysconfig/network/HOSTNAME $fqdn",
  }
  if is_mac_address($::macaddress_eth0) {
    include ::platform_services_network::serv
  }
  if is_mac_address($::macaddress_eth1) {
    include ::platform_services_network::stor
  }
  if is_mac_address($::macaddress_eth2) {
    include ::platform_services_network::sync
  }
}
