define platform_services_haproxy::member(
  $service,
  $vip = false,
  $ports,
  $options = 'check'
) {
  @@haproxy::balancermember{$::fqdn:
    listening_service => $service,
    server_names      => $::hostname,
    ipaddresses       => $vip,
    ports             => $ports,
    options           => $options
  }
  if $vip {
    platform_services_cloudstack::port_forwardings{$ports:
      vip => $vip,
    }
  }
}
