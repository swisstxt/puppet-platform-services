define platform_services_dns::server::zone(
  $nsip,
  $rdns_networks = $nsip
) {
  dns::zone{$name:
    serial => 1360059950,
    soa => "dns-01.$name",
    soa_email => "admin.$name",
    nameservers => ["dns-01.$name"],
  }
  $rdns_zones = ip_to_arpa($rdns_networks)
  dns::zone{$rdns_zones:
    serial => 1360059950,
    soa => "dns-01.$name",
    soa_email => "admin.$name",
    nameservers => ["dns-01.$name"],
  }
  dns::record::a{"dns-${::platform_services::node_nr}.${name}":
    host => "dns-${::platform_services::node_nr}",
    zone => $name,
    data => [$nsip],
  }
}
