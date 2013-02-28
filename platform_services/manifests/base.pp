class platform_services::base {
  include ::platform_services::sanity_checks

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
  include ::nscd
  include ::sudo
  include ::screen
  include ::logrotate
  include ::swisstxt_yum
  include ::swisstxt_resolvconf
  include ::swisstxt_dns::member
  include ::swisstxt_puppet::agent
  include ::swisstxt_icinga::target
  include ::swisstxt_firewall
  include ::swisstxt_firewall::ssh
}
