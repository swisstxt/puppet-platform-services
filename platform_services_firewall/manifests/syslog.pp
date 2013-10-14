class platform_services_firewall::syslog {
  firewall{'021 accept syslog':
    proto => 'udp',
    dport => 514,
    action => 'accept',
  }
}
