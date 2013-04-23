class platform_services_puppet::agent(
  $site_classes = undef
) {
  include ::puppet
  include ::puppet::cron
  if $site_classes {
    class{$site_classes:}
  }
}
