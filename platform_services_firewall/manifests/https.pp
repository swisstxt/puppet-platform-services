class platform_services_firewall::https {
  firewall{'021 accept https':
    proto => 'tcp',
    dport => 443,
    action => 'accept',
    notify => Exec['persist-firewall'],
  }
}
