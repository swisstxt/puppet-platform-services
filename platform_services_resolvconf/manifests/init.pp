class platform_services_resolvconf {
  resolvconf::domain{"${::mpc_zone}.serv.${::mpc_project}.${::mpc_bu}.mpc":}
  #resolvconf::search{$domain:}
  Resolvconf::Nameserver <<||>>
}
