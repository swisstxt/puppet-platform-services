class platform_services_firewall::nrpe {
  firewall{'012 accept nrpe':
    proto => 'tcp',
    source => "${network_eth0}/${netmask_eth0}",
    dport => 5666,
    action => 'accept',
  }
}
