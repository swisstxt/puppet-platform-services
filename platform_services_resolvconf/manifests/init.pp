class platform_services_resolvconf {
  resolvconf::search{"${::mpc_zone}.serv.${::mpc_project}.${::mpc_bu}.mpc":}
  resolvconf::search{"${::mpc_zone}.${::mpc_project}.${::mpc_bu}.mpc":}
  if $::mpc_network_front == $::network_eth0 {
    resolvconf::domain{"${::mpc_zone}.${::mpc_project}.${::mpc_bu}.mpc":}
    Resolvconf::Nameserver <<|tag=='front'|>>
  } else {
    resolvconf::domain{"${::mpc_zone}.serv.${::mpc_project}.${::mpc_bu}.mpc":}
    Resolvconf::Nameserver <<|tag=='internal'|>>
  }
}
