class platform_services_resolvconf {
  resolvconf::domain{"${::region}.serv.${::project}.${::ue}.mpc":}
  #resolvconf::search{$domain:}
  Resolvconf::Nameserver <<||>>
}
