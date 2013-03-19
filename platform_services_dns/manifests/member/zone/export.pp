define platform_services_dns::member::zone::export(
  $domain,
  $hostname,
  $ipaddress,
  $ptr = false
) {
  dns::record::a{$name:
    host => $hostname,
    zone => $domain,
    data => $ipaddress,
    ptr  => $ptr,
  }
}
