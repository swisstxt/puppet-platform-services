class platform_services_firewall {
  resources{'firewall':
    purge => true,
  }

  class { 'firewall': }

  firewall{'000 accept all icmp':
    proto => 'icmp',
    action => 'accept',
  }->
  firewall{'001 accept all to lo interface':
    proto => 'all',
    iniface => 'lo',
    action => 'accept',
  }->
  firewall{'002 accept related established rules':
    proto => 'all',
    state => ['RELATED', 'ESTABLISHED'],
    action => 'accept',
  }->
  firewall{'998 reject all':
    action => 'reject',
    reject => 'icmp-host-prohibited',
  }
  firewall{'999 reject all':
    chain => 'FORWARD',
    action => 'reject',
    reject => 'icmp-host-prohibited',
  }
}
