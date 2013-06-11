class platform_services::vip(
  $ports = [80]
) {
  unless has_key($::platform_services::vips, $::platform_services::node_nr) {
    fail("must provide vip for ${::platform_services::node_role} node number ${::platform_services::node_nr}")
  }

  $ip = $::platform_services::vips[$::platform_services::node_nr]

  platform_services_cloudstack::port_forwarding{$ports:
    vip => $ip,
  }
  platform_services_dns::member::vip{$::hostname:
    vip => $ip,
  }
}
