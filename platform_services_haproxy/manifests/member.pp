define platform_services_haproxy::member(
  $service,
  $ports,
  $front_ip = false,
  $options = 'check'
) {
  if $front_ip {
    platform_services_cloudstack::port_forwarding{$ports:
      front_ip => $front_ip,
    }
    $ip = $front_ip
  } else {
    $ip = $::ipaddress
  }
  @@haproxy::balancermember{"${::fqdn}#${ports}":
    listening_service => $service,
    server_names      => $::hostname,
    ipaddresses       => $ip,
    ports             => $ports,
    options           => $options
  }
}
