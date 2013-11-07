class platform_services_firewall::puppetmaster {
  firewall{'110 accept puppetmaster':
    proto => 'tcp',
    dport => 8140,
    action => 'accept',
    notify => Exec['persist-firewall'],
  }
}
