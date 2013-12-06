class platform_services_resolvconf::nameserver(
  $vip,
  $default_nameserver = [ "193.218.104.190", "193.218.103.253" ]
) {
  Class['::platform_services_resolvconf::nameserver'] <- Class['::dns::server::service']

  @@resolvconf::nameserver{$default_nameserver:
    priority => 1,
    tag => 'internal',
  }

  $cloudstack_nameserver = regsubst(baseip(), '^(\d+)\.(\d+)\.(\d+)\.(\d+)$',  '\1.\2.\3.1')
  @@resolvconf::nameserver{$cloudstack_nameserver:
    priority => 10,
    tag => 'internal',
  }
}
