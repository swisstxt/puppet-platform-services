define platform_services_dns::member::zone(
  $domain,
  $hostname,
  $ipaddress
) {
  @@platform_services_dns::member::zone::export{"${hostname}.${domain}":
    domain    => $domain,
    hostname  => $hostname,
    ipaddress => $ipaddress,
  }
}
