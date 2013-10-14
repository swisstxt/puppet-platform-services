class platform_services_dns::member {
  require platform_services_dns

  if is_ip_address($platform_services_dns::ipaddress_serv) {
    platform_services_dns::member::zone{"${::hostname}.${::mpc_zone}.serv.${::mpc_project}.${::mpc_bu}.mpc":
      domain => "${::mpc_zone}.serv.${::mpc_project}.${::mpc_bu}.mpc",
      hostname => $::hostname,
      ipaddress => $platform_services_dns::ipaddress_serv,
      ptr => true,
    }
  }
  if is_ip_address($platform_services_dns::ipaddress_sync) {
    platform_services_dns::member::zone{"${::hostname}.${::mpc_zone}.sync.${::mpc_project}.${::mpc_bu}.mpc":
      domain => "${::mpc_zone}.sync.${::mpc_project}.${::mpc_bu}.mpc",
      hostname => $::hostname,
      ipaddress => $platform_services_dns::ipaddress_sync,
      ptr => true,
    }
  }
  if is_ip_address($platform_services_dns::ipaddress_stor) {
    platform_services_dns::member::zone{"${::hostname}.${::mpc_zone}.stor.${::mpc_project}.${::mpc_bu}.mpc":
      domain => "${::mpc_zone}.stor.${::mpc_project}.${::mpc_bu}.mpc",
      hostname => $::hostname,
      ipaddress => $platform_services_dns::ipaddress_stor,
      ptr => true,
    }
  }
}
