class platform_services_firewall::nrpe {
  firewall{'013 accept nrpe':
    proto => 'tcp',
    dport => 5666,
    action => 'accept',
  }
}
