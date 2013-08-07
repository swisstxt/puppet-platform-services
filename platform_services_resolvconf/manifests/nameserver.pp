class platform_services_resolvconf::nameserver(
  $vip,
) {
  Class['::platform_services_resolvconf::nameserver'] <- Class['::dns::server::service']
  @@resolvconf::nameserver{$vip:
    priority => 1,
    tag => 'front',
  }
  @@resolvconf::nameserver{$::ipaddress:
    priority => 1,
    tag => 'internal'
  }
  $default_nameserver = regsubst($::ipaddress, '^(\d+)\.(\d+)\.(\d+)\.(\d+)$',  '\1.\2.\3.1')
  @@resolvconf::nameserver{$default_nameserver:
    priority => 10,
    tag => 'internal',
  }
}
