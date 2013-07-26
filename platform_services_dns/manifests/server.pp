class platform_services_dns::server {
  include ::platform_services_resolvconf::nameserver
  include ::platform_services_dns::collector
  include ::platform_services_firewall::dns

  unless is_mac_address($::macaddress_eth0) and is_mac_address($::macaddress_eth1) and is_mac_address($::macaddress_eth2) {
    fail("dns server must have all interfaces up and running")
  }

  include ::dns
  platform_services_dns::server::zone{
    "${::mpc_project}.${::mpc_bu}.mpc":
      nsip => $front_ip,
      rdns_networks => $::mpc_network_front;
    "${::mpc_zone}.serv.${::mpc_project}.${::mpc_bu}.mpc":
      nsip => $::ipaddress_eth0;
    "${::mpc_zone}.sync.${::mpc_project}.${::mpc_bu}.mpc":
      nsip => $::ipaddress_eth1;
    "${::mpc_zone}.stor.${::mpc_project}.${::mpc_bu}.mpc":
      nsip => $::ipaddress_eth2;
  }

  platform_services_cloudstack::port_forwarding{'53/tcp':
    front_ip =>  $front_ip,
    port => 53,
    protocol => 'tcp',
  }
  platform_services_cloudstack::port_forwarding{'53/udp':
    front_ip =>  $front_ip,
    port => 53,
    protocol => 'udp',
  }
}
