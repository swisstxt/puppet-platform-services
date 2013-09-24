# Version von platform_services_resolvconf welche für den Moment funktioniert.
# Die Swisstxt Nameserver - inklusive derjenige von Cloudstack' - delegieren momentan nicht
# an unsere Server.
# Um irgendwie weiter arbeiten zu können: Diese Lösung!
# @see  platform_services_resolvconf::nameserver

class platform_services_resolvconf {
  resolvconf::domain{"${::mpc_zone}.serv.${::mpc_project}.${::mpc_bu}.mpc":}
  #resolvconf::search{$domain:}
  if $::mpc_network_front == $::network_eth0 {
    Resolvconf::Nameserver <<|tag=='front'|>>
  } else {
    Resolvconf::Nameserver <<|tag=='internal'|>>

  }
}
