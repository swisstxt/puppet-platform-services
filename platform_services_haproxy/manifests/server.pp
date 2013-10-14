class platform_services_haproxy::server(
  $high_available = false,
  $site_classes = undef
) {
  class{'::haproxy':}
  if $high_available {
    sysctl::value{'net.ipv4.ip_nonlocal_bind': value => '1'}
    include keepalived
    keepalived::vrrp_script{'haproxy': name_is_process => true }
  }
  if $site_classes {
    class{$site_classes:}
  }
}

