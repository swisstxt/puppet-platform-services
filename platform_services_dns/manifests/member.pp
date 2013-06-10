class platform_services_dns::member{
  if is_ip_address($::ipaddress_eth0) {
    platform_services_dns::member::zone{"${::hostname}.${::mpc_zone}.serv.${::mpc_project}.${::mpc_bu}.mpc":
      domain => "${::mpc_zone}.serv.${::mpc_project}.${::mpc_bu}.mpc",
      hostname => $::hostname,
      ipaddress => $::ipaddress_eth0,
      ptr => true,
    }
  }
  if is_ip_address($::ipaddress_eth1) {
    platform_services_dns::member::zone{"${::hostname}.${::mpc_zone}.sync.${::mpc_project}.${::mpc_bu}.mpc":
      domain => "${::mpc_zone}.sync.${::mpc_project}.${::mpc_bu}.mpc",
      hostname => $::hostname,
      ipaddress => $::ipaddress_eth1,
      ptr => true,
    }
  }
  if is_ip_address($::ipaddress_eth2) {
    platform_services_dns::member::zone{"${::hostname}.${::mpc_zone}.stor.${::mpc_project}.${::mpc_bu}.mpc":
      domain => "${::mpc_zone}.stor.${::mpc_project}.${::mpc_bu}.mpc",
      hostname => $::hostname,
      ipaddress => $::ipaddress_eth2,
      ptr => true,
    }
  }
}
