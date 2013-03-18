class platform_services_dns::server {
  include ::platform_services_resolvconf::nameserver
  include ::platform_services_dns::collector
  include ::platform_services_firewall::dns

  unless is_ip_address($::ipaddress_eth0) and is_ip_address($::ipaddress_eth1) and is_ip_address($::ipaddress_eth2) {
    fail("dns server must have all interfaces up and running")
  }
  unless has_key($::dns_vips, $::platform_services::node_nr) {
    fail("must provide vip for dns node nr $::platform_services::node_nr")
  }

  class{'dns':
    named_conf_template => 'platform_services_dns/named.conf.erb',
  }
  @@platform_services_dns::server::zone{
    "${::project}.${::ue}.mpc":
      nsip => $::dns_vips[$::platform_services::node_nr],
      rdns_networks => $::network_front;
    "${::region}.serv.${::project}.${::ue}.mpc":
      nsip => $::ipaddress_eth0;
    "${::region}.sync.${::project}.${::ue}.mpc":
      nsip => $::ipaddress_eth1;
    "${::region}.stor.${::project}.${::ue}.mpc":
      nsip => $::ipaddress_eth2;
  }

  platform_services_cloudstack::port_forwarding{'53/tcp':
    vip =>  $::dns_vips[$::platform_services::node_nr],
    port => 53,
    protocol => 'tcp',
  }
  platform_services_cloudstack::port_forwarding{'53/udp':
    vip =>  $::dns_vips[$::platform_services::node_nr],
    port => 53,
    protocol => 'udp',
  }
}
