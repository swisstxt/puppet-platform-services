class platform_services::vip(
  $ports = [80]
) {
  unless is_hash($::platform_services::vips) {
    fail("must provide top-scope variable \$${::platform_services::node_role}_vips")
  }
  unless has_key($::platform_services::vips, $::platform_services::node_nr) {
    fail("must provide vip for ${::platform_services::node_role} node_nr ${::platform_services::node_nr}")
  }

  $ip = $::platform_services::vips[$::platform_services::node_nr]

  platform_services_cloudstack::port_forwarding{$ports:
    vip => $ip,
  }
  platform_services_dns::member::vip{$::hostname:
    vip => $ip,
  }
}
