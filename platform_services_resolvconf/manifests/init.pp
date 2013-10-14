class platform_services_resolvconf {
  resolvconf::domain{"${::mpc_zone}.serv.${::mpc_project}.${::mpc_bu}.mpc":}
  #resolvconf::search{$domain:}
  if $::mpc_network_front == $::network_eth0 { 
    Resolvconf::Nameserver <<|tag=='front'|>>
  } else {
   Resolvconf::Nameserver <<|tag=='internal'|>>
  }
}
