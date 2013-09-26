define platform_services_haproxy::member(
  $service,
  $ports,
  $front_ip = false,
  $options = 'check'
) {
  @@haproxy::balancermember{$::fqdn:
    listening_service => $service,
    server_names      => $::hostname,
    ipaddresses       => $front_ip,
    ports             => $ports,
    options           => $options
  }
  if $front_ip {
    platform_services_cloudstack::port_forwarding{$ports:
      front_ip => $front_ip,
    }
  }
}
