class platform_services_firewall::dns {
  firewall{'010 accept dns/tcp':
    proto => 'tcp',
    dport => 53,
    action => 'accept',
  }
  firewall{'011 accept dns/udp':
    proto => 'udp',
    dport => 53,
    action => 'accept',
  }
}
