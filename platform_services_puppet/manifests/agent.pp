class platform_services_puppet::agent(
  $site_classes = undef,
  $run_method   = 'cron'
) {
  include ::puppet

  case $run_method {
    'cron':   { include ::puppet::cron   }
    'daemon': { include ::puppet::daemon }
    'none':   { include ::puppet::manual }
    default:  { fail("No such puppet run mode ${run_mode}. possible values are 'cron', 'daemon' or 'none'") }
  }

  if $site_classes {
    class{$site_classes:}
  }
}
