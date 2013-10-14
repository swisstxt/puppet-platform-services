define platform_services_dns::member::zone_front(
  $front_ip
) {
  platform_services_dns::member::zone{"${name}.${::mpc_zone}.${::mpc_project}.${::mpc_bu}.mpc":
    domain => "${::mpc_zone}.${::mpc_project}.${::mpc_bu}.mpc",
    hostname => $name,
    ipaddress => $front_ip,
  }
}
