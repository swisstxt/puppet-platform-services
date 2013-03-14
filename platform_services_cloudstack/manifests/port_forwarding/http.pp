class platform_services_cloudstack::port_forwarding::http(
  $vip
) {
  platform_services_cloudstack::port_forwarding{80:
    vip => $vip,
  }
}
