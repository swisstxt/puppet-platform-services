class platform_services_puppet::agent(
  $site_classes = undef,
  $run_method   = 'cron'
) {
  include ::puppet

  case $run_method {
    'cron':   { include ::puppet::cron   }
    'deamon': { include ::puppet::daemon }
  }

  if $site_classes {
    class{$site_classes:}
  }
}
