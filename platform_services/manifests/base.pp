class platform_services::base(
  $site_classes = undef
) {
  include ::cron
  include ::platform_services_dns::member
  include ::platform_services_ntp::client
  include ::platform_services_icinga::target

  unless hiera('platform_services_puppet::agent::disable', false) {
    include ::platform_services_puppet::agent
  }

  case $osfamily {
     'RedHat': {
       include ::platform_services::base::redhat
     }
     'Debian': {
       include ::platform_services::base::debian
     }
  }

  if $site_classes {
    class{$site_classes:}
  }
}
