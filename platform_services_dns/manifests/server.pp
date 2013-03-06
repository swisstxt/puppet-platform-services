class platform_services_dns::server {
  include ::platform_services_resolvconf::nameserver
  include ::platform_services_firewall::dns
  include ::platform_services_dns::collector

  unless is_ip_address($::ipaddress_eth0) or is_ip_address($::ipaddress_eth1) or is_ip_address($::ipaddress_eth2) {
    fail("dns server must have interfaces up and running")
  }

  $server_nr = regsubst($::hostname, '^.*-(\d+)$', '\1')
  unless has_key($::dns_vips, $server_nr) {
    fail("must provide dns_vip for dns server nr $server_nr")
  }

  class{'dns':
    named_conf_template => 'platform_services_dns/named.conf.erb',
  }

  @@platform_services_dns::server::zone{
    "${::project}.${::ue}.mpc":
      nsip => $::dns_vips[$server_nr],
      rdns_networks => $::network_front;
    "${::region}.serv.${::project}.${::ue}.mpc":
      nsip => $::ipaddress_eth0;
    "${::region}.sync.${::project}.${::ue}.mpc":
      nsip => $::ipaddress_eth1;
    "${::region}.stor.${::project}.${::ue}.mpc":
      nsip => $::ipaddress_eth2;
  }

  class{'::platform_services_cloudstack::port_forwarding::nameserver':
    vip => $::dns_vips[$server_nr],
  }
}
