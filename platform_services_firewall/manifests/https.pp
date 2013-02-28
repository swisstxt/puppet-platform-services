class platform_services_firewall::https {
  firewall{'021 accept https':
    proto => 'tcp',
    dport => 80,
    action => 'accept',
  }
}
