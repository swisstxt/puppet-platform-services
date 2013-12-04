class platform_services_firewall::ssh {
  firewall{'012 accept ssh':
    proto => 'tcp',
    dport => 22,
    action => 'accept',
  }
}
