class platform_services_firewall::http {
  firewall{'020 accept http':
    proto => 'tcp',
    dport => 80,
    action => 'accept',
    notify => Exec['persist-firewall'],
  }
}
