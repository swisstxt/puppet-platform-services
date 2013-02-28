define platform_services_dns::member::vip(
  $vip
) {
  platform_services_dns::member::zone{"${name}.${::project}.${::ue}.mpc":
    domain => "${::project}.${::ue}.mpc",
    hostname => $name,
    ipaddress => $vip,
  }
}
