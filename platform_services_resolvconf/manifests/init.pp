class platform_services_resolvconf(
  $timeout = 3,
  $fallback_nameserver = undef,
){
  resolvconf::search{"${::mpc_zone}.serv.${::mpc_project}.${::mpc_bu}.mpc":}
  resolvconf::search{"${::mpc_zone}.${::mpc_project}.${::mpc_bu}.mpc":}
  
  resolvconf::option {'timeout':
    value => $timeout,
  }
  
  $cloudstaack_nameserver = regsubst(baseip(), '^(\d+)\.(\d+)\.(\d+)\.(\d+)$',  '\1.\2.\3.1')
  resolvconf::nameserver{$cloudstack_nameserver:
    ensure => absent,
  }
  
  if $::mpc_network_front == $::network_eth0 {
    resolvconf::domain{"${::mpc_zone}.${::mpc_project}.${::mpc_bu}.mpc":}
    Resolvconf::Nameserver <<| tag=='front' |>>
  } else {
    resolvconf::domain{"${::mpc_zone}.serv.${::mpc_project}.${::mpc_bu}.mpc":}
    Resolvconf::Nameserver <<| tag=='serv' |>>
  }

  if $fallback_nameserver {
    resolvconf::nameserver{$fallback_nameserver:
      priority => 10,
    }
  }
}
