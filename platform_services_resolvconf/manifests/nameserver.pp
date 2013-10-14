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
  if $::platform_services_dns::ipaddress_dns_2nd {
    @@resolvconf::nameserver{$::platform_services_dns::ipaddress_dns_2nd:
      priority => 2,
      tag => 'internal',
    }
  } else {
    $default_nameserver = regsubst(baseip(), '^(\d+)\.(\d+)\.(\d+)\.(\d+)$',  '\1.\2.\3.1')
    if $default_nameserver != $::ipaddress {
      @@resolvconf::nameserver{$default_nameserver:
        priority => 10,
        tag => 'internal',
      }
    }
  }
}
