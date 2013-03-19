define platform_services_dns::member::zone(
  $domain,
  $hostname = $name,
  $ipaddress,
  $ptr = false
) {
  @@platform_services_dns::member::zone::export{"${hostname}.${domain}":
    domain    => $domain,
    hostname  => $hostname,
    ipaddress => $ipaddress,
    ptr       => $ptr,
  }
}
