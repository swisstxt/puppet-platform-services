class platform_services_cloudstack::port_forwarding::nameserver(
  $vip
) {
  platform_services_cloudstack::port_forwarding{53:
    vip      => $vip,
    protocol => 'tcp',
  }
  platform_services_cloudstack::port_forwarding{53:
    vip      => $vip,
    protocol => 'udp',
  }
}
