class platform_services_haproxy::server(
  $site_classes = undef
) {
  class{'::haproxy':}
  if $site_classes {
    class{$site_classes:}
  }
}
