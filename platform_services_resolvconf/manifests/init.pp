class platform_services_resolvconf {
  resolvconf::domain{"${::mpc_zone}.serv.${::mpc_project}.${::mpc_bu}.mpc":}
  resolvconf::search{"${::mpc_zone}.serv.${::mpc_project}.${::mpc_bu}.mpc":}
  Resolvconf::Nameserver
}