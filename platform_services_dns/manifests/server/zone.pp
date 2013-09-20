define platform_services_dns::server::zone(
  $nsip,
  $rdns_networks = $nsip,
  $nameservers = [ "${::hostname}.${::mpc_zone}.${::mpc_project}.${::mpc_bu}.mpc", "ns3.swisstxt.ch", "ns4.swisstxt.ch" ]
) {
  dns::zone{$name:
    serial => 1360059950,
    soa => "${::hostname}.${::mpc_zone}.${::mpc_project}.${::mpc_bu}.mpc",
    soa_email => "admin.$name",
    nameservers => $nameservers,
  }
  unless $rdns_networks {
    $rdns_zones = ip_to_arpa($rdns_networks, '22')
    dns::zone{$rdns_zones:
      serial => 1360059950,
      soa => "${::hostname}.${::mpc_zone}.${::mpc_project}.${::mpc_bu}.mpc",
      soa_email => "admin.$name",
      nameservers => $nameservers,
    }
  }
}
