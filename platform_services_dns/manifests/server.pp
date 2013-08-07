class platform_services_dns::server {
  include ::platform_services_dns::collector
  include ::platform_services_firewall::dns

  # fail if interfaces are not available
  unless (is_mac_address($::platform_services_dns::macaddress_serv) and is_mac_address($::platform_services_dns::macaddress_sync) and is_mac_address($platform_services_dns::macaddress_stor)) {
    fail("dns server must have all interfaces available")
  }

  # don't do anything if interfaces have no ips (also don't fail)
  if (is_ip_address($::platform_services_dns::ipaddress_serv) and is_ip_address($::platform_services_dns::ipaddress_sync) and is_ip_address($::platform_services_dns::ipaddress_stor)) {
    include ::platform_services_dns::collector
    include ::platform_services_firewall::dns
    include ::dns

  class{'::platform_services_resolvconf::nameserver':
    vip => $vip,
  }
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
