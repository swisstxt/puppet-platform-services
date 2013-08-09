class platform_services_resolvconf::nameserver(
  $ip,
  $default_nameserver = regsubst($ip, '^(\d+)\.(\d+)\.(\d+)\.(\d+)$',  '\1.\2.\3.1'),
) {
  Class['::platform_services_resolvconf::nameserver'] <- Class['::dns::server::service']
  

  @@resolvconf::nameserver{$ip:
    ensure => present,
  }  
  @@resolvconf::nameserver{$default_nameserver:
    ensure => absent,
  }
}
