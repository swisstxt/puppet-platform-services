class platform_services_resolvconf::nameserver(
  $vip,
  $default_nameserver = [ "193.218.104.190", "193.218.103.253" ]
) {
  Class['::platform_services_resolvconf::nameserver'] <- Class['::dns::server::service']

  @@resolvconf::nameserver{$default_nameserver:
    priority => 10,
    tag => 'internal',
  }
}
