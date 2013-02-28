class platform_services_dns::member{
  if is_ip_address($::ipaddress_eth0) {
    platform_services_dns::member::zone{"${::hostname}.${::region}.serv.${::project}.${::ue}.mpc":
      domain => "${::region}.serv.${::project}.${::ue}.mpc",
      hostname => $::hostname,
      ipaddress => $::ipaddress_eth0;
    }
  }
  if is_ip_address($::ipaddress_eth1) {
    platform_services_dns::member::zone{"${::hostname}.${::region}.sync.${::project}.${::ue}.mpc":
      domain => "${::region}.sync.${::project}.${::ue}.mpc",
      hostname => $::hostname,
      ipaddress => $::ipaddress_eth1;
    }
  }
  if is_ip_address($::ipaddress_eth2) {
    platform_services_dns::member::zone{"${::hostname}.${::region}.stor.${::project}.${::ue}.mpc":
      domain => "${::region}.stor.${::project}.${::ue}.mpc",
      hostname => $::hostname,
      ipaddress => $::ipaddress_eth2;
    }
  }
}
