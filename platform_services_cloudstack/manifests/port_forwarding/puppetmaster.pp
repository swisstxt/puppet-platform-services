class platform_services_cloudstack::port_forwarding::puppetmaster(
  $vip
) {
  platform_services_cloudstack::port_forwarding{8140:
    vip => $vip,
  }
}
