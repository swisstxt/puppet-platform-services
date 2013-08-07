define platform_services_dns::server::zone(
  $nsip,
  $rdns_networks = $nsip
) {
  dns::zone{$name:
    serial => 1360059950,
    soa => "${::hostname}.${name}",
    soa_email => "admin.$name",
    nameservers => ["${::hostname}.${name}"],
  }
  $rdns_zones = ip_to_arpa($rdns_networks, '22')
  dns::zone{$rdns_zones:
    serial => 1360059950,
    soa => "${::hostname}.${name}",
    soa_email => "admin.$name",
    nameservers => ["${::hostname}.${name}"],
  }
}