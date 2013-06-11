class platform_services_puppet::agent(
  $site_classes = undef
) {
  include ::puppet
  unless hiera('platform_services_puppet::agent::cron::disable', false) {
    include ::puppet::cron
  }
  if $site_classes {
    class{$site_classes:}
  }
}
