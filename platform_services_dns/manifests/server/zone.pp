define platform_services_dns::server::zone(
  $nsip,
  $rdns_networks = $nsip
) {
  dns::zone{$name:
    serial => 1360059950,
    soa => "ns1.$name",
    soa_email => "admin.$name",
    nameservers => ["ns1.$name"],
  }
  $rdns_zones = ip_to_arpa($rdns_networks)
  dns::zone{$rdns_zones:
    serial => 1360059950,
    soa => "ns1.$name",
    soa_email => "admin.$name",
    nameservers => ["ns1.$name"],
  }
  dns::record::a{"ns${::platform_services_dns::server::server_nr}.${name}":
    host => "ns${server_nr}",
    zone => $name,
    data => [$nsip],
  }
}
