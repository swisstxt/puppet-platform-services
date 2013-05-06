class platform_services_network {
  augeas{'sysconfig/network hostname':
    changes => "set /files/etc/sysconfig/network/HOSTNAME $fqdn",
  }
  if is_mac_address($::macaddress_eth0) {
    class{'::platform_services_network::serv':
      stage => pre,
    }
  }
  if is_mac_address($::macaddress_eth1) {
    class{'::platform_services_network::stor':
      stage => pre,
    }
  }
  if is_mac_address($::macaddress_eth2) {
    class{'::platform_services_network::sync':
      stage => pre,
    }
  }
}
