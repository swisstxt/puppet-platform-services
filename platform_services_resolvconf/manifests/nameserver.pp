class platform_services_resolvconf::nameserver(
  $ip,
) {
  Class['::platform_services_resolvconf::nameserver'] <- Class['::dns::server::service']
  @@resolvconf::nameserver{$ip:
    priority => 1,
  }
  $default_nameserver = regsubst($ip, '^(\d+)\.(\d+)\.(\d+)\.(\d+)$',  '\1.\2.\3.1')
  @@resolvconf::nameserver{$default_nameserver:
    priority => 10,
  }
}
