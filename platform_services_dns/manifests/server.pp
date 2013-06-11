class platform_services_dns::server {
  include ::platform_services_resolvconf::nameserver
  include ::platform_services_dns::collector
  include ::platform_services_firewall::dns

  unless is_mac_address($::macaddress_eth0) and is_mac_address($::macaddress_eth1) and is_mac_address($::macaddress_eth2) {
    fail("dns server must have all interfaces up and running")
  }
  unless has_key($::platform_services::vip_last_octets, $::platform_services::node_nr) {
    fail("must provide vip-suffix for ${::platform_services::node_role} node number ${::platform_services::node_nr}")
  }

  $vip_last_octet = $::platform_services::vip_last_octets[$::platform_services::node_nr]
  $vip = inline_template("<%= mpc_network_front.sub(/0$/, '') + vip_last_octet %>")

  class{'dns':
    named_conf_template => 'platform_services_dns/named.conf.erb',
  }
  @@platform_services_dns::server::zone{
    "${::mpc_project}.${::mpc_bu}.mpc":
      nsip => $vip,
      rdns_networks => $::mpc_network_front;
    "${::mpc_zone}.serv.${::mpc_project}.${::mpc_bu}.mpc":
      nsip => $::ipaddress_eth0;
    "${::mpc_zone}.sync.${::mpc_project}.${::mpc_bu}.mpc":
      nsip => $::ipaddress_eth1;
    "${::mpc_zone}.stor.${::mpc_project}.${::mpc_bu}.mpc":
      nsip => $::ipaddress_eth2;
  }

  platform_services_cloudstack::port_forwarding{'53/tcp':
    vip =>  $vip,
    port => 53,
    protocol => 'tcp',
  }
  platform_services_cloudstack::port_forwarding{'53/udp':
    vip =>  $vip,
    port => 53,
    protocol => 'udp',
  }
}
