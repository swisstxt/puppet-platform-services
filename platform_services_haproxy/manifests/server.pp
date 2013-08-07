class platform_services_haproxy::server(
  $high_available = false,
  $site_classes = undef
) {
  class{'::haproxy':}
  if ($high_available) {
    class{'::keepalived':}
  }
  if $site_classes {
    class{$site_classes:}
  }
}
