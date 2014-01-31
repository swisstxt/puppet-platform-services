class platform_services_resolvconf::nameserver(
  $front_ip = undef,
){
  if $front_ip {
    @@resolvconf::nameserver{$front_ip:
      priority => $::platform_services::node_nr,
      tag => 'front',
    }
  }
  @@resolvconf::nameserver{$::ipaddress:
    priority => $::platform_services::node_nr,
    tag => 'serv'
  }
}
