define platform_services_dns::member::vip(
  $vip
) {
  platform_services_dns::member::zone{"${name}.${::mpc_project}.${::mpc_bu}.mpc":
    domain => "${::mpc_project}.${::mpc_bu}.mpc",
    hostname => $name,
    ipaddress => $vip,
  }
}
