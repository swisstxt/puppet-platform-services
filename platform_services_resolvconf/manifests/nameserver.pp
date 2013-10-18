class platform_services_resolvconf::nameserver(
  $front_ip = false,
) {
  Class['::platform_services_resolvconf::nameserver'] <- Class['::dns::server::service']

  include platform_services

  if $front_ip {
    @@resolvconf::nameserver{$front_ip:
      priority => 1,
      tag => 'front',
    }
  }
  @@resolvconf::nameserver{$::ipaddress:
    priority => 1,
    tag => 'internal'
  }
}
