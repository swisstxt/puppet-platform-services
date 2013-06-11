class platform_services::vip(
  $ports = [80]
) {
  unless has_key($::platform_services::vip_last_octets, $::platform_services::node_nr) {
    fail("must provide vip-suffix for ${::platform_services::node_role} node number ${::platform_services::node_nr}")
  }

  $vip_last_octet = $::platform_services::vip_last_octets[$::platform_services::node_nr]
  $vip = inline_template("<%= mpc_network_front.sub(/0$/, '') + vip_last_octet %>")

  platform_services_cloudstack::port_forwarding{$ports:
    vip => $vip,
  }
  platform_services_dns::member::vip{$::hostname:
    vip => $vip,
  }
}
