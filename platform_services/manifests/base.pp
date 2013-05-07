class platform_services::base {
  disabled::service{[
    'cups',
    'dbus',
  ]:}
  if $lsbmajdistrelease == 5 {
    disabled::service{[
      'avahi',
      'acpid',
      'hal',
      'kudzu',
      'readahead',
      'lvm',
      'nfs',
    ]:}
    #include ::platform_services_sendmail
  }
  if $lsbmajdistrelease == 6 {
    #include ::postfix
  }
  include ::bash
  include ::cron
  include ::sudo
  include ::screen
  include ::logrotate
  include ::platform_services_yum
  include ::platform_services_network
  include ::platform_services_resolvconf
  include ::platform_services_dns::member
  include ::platform_services_icinga::target
  include ::platform_services_pakiti::client
  include ::platform_services_firewall
  include ::platform_services_firewall::ssh
  include ::platform_services_authconfig
  unless hiera('platform_services_puppet::agent::disable') {
    include ::platform_services_puppet::agent
  }
  if defined('::base') {
    include ::base
  }
}
